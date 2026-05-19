# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "../../../types/list_points_boosts_response"
require "json"
require_relative "../../../types/create_points_boosts_request"
require_relative "../../../types/create_points_boosts_response"
require_relative "../../../types/delete_points_boosts_response"
require_relative "../../../types/patch_points_boosts_request"
require_relative "../../../types/patch_points_boosts_response"
require_relative "../../../types/admin_points_boost"
require "async"

module TrophyApiClient
  module Admin
    module Points
      class BoostsClient
        # @return [TrophyApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Points::BoostsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points boosts for a system.
        #
        # @param system_id [String] The UUID of the points system.
        # @param limit [Integer] Maximum number of results to return (1-100, default 10).
        # @param skip [Integer] Number of results to skip for pagination (default 0).
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_BOOSTS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.list(
        #    system_id: "550e8400-e29b-41d4-a716-446655440000",
        #    limit: 1,
        #    skip: 1
        #  )
        def list(system_id:, limit: nil, skip: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "skip": skip
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(environment: admin,
                                               request_options: request_options)}/points/#{system_id}/boosts"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::AdminPointsBoost.from_json(json_object: item)
          end
        end

        # Create points boosts.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::CREATE_POINTS_BOOSTS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.create(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ user_id: "user-123", name: "Double XP Weekend", start: "2024-01-01", end_: "2024-01-03", multiplier: 2 }])
        def create(system_id:, request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: admin,
                                               request_options: request_options)}/points/#{system_id}/boosts"
          end
          TrophyApiClient::CreatePointsBoostsResponse.from_json(json_object: response.body)
        end

        # Delete multiple points boosts by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param ids [String] A list of up to 100 boost IDs.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.delete
        def delete(system_id:, ids: nil, request_options: nil)
          response = @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "ids": ids }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(environment: admin,
                                               request_options: request_options)}/points/#{system_id}/boosts"
          end
          TrophyApiClient::DeletePointsBoostsResponse.from_json(json_object: response.body)
        end

        # Update multiple points boosts.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::PATCH_POINTS_BOOSTS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::PatchPointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.update(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Updated Boost Name", multiplier: 3 }])
        def update(system_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: admin,
                                               request_options: request_options)}/points/#{system_id}/boosts"
          end
          TrophyApiClient::PatchPointsBoostsResponse.from_json(json_object: response.body)
        end

        # Get a single points boost by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param id [String] The UUID of the points boost.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsBoost]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.get(system_id: "550e8400-e29b-41d4-a716-446655440000", id: "660f9500-f30c-42e5-b827-557766550001")
        def get(system_id:, id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(environment: admin,
                                               request_options: request_options)}/points/#{system_id}/boosts/#{id}"
          end
          TrophyApiClient::AdminPointsBoost.from_json(json_object: response.body)
        end
      end

      class AsyncBoostsClient
        # @return [TrophyApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Points::AsyncBoostsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points boosts for a system.
        #
        # @param system_id [String] The UUID of the points system.
        # @param limit [Integer] Maximum number of results to return (1-100, default 10).
        # @param skip [Integer] Number of results to skip for pagination (default 0).
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_BOOSTS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.list(
        #    system_id: "550e8400-e29b-41d4-a716-446655440000",
        #    limit: 1,
        #    skip: 1
        #  )
        def list(system_id:, limit: nil, skip: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
              req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "skip": skip
              }.compact
              unless request_options.nil? || request_options&.additional_body_parameters.nil?
                req.body = { **(request_options&.additional_body_parameters || {}) }.compact
              end
              req.url "#{@request_client.get_url(environment: admin,
                                                 request_options: request_options)}/points/#{system_id}/boosts"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              TrophyApiClient::AdminPointsBoost.from_json(json_object: item)
            end
          end
        end

        # Create points boosts.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::CREATE_POINTS_BOOSTS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.create(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ user_id: "user-123", name: "Double XP Weekend", start: "2024-01-01", end_: "2024-01-03", multiplier: 2 }])
        def create(system_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
              req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              unless request_options.nil? || request_options&.additional_query_parameters.nil?
                req.params = { **(request_options&.additional_query_parameters || {}) }.compact
              end
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: admin,
                                                 request_options: request_options)}/points/#{system_id}/boosts"
            end
            TrophyApiClient::CreatePointsBoostsResponse.from_json(json_object: response.body)
          end
        end

        # Delete multiple points boosts by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param ids [String] A list of up to 100 boost IDs.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.delete
        def delete(system_id:, ids: nil, request_options: nil)
          Async do
            response = @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
              req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = { **(request_options&.additional_query_parameters || {}), "ids": ids }.compact
              unless request_options.nil? || request_options&.additional_body_parameters.nil?
                req.body = { **(request_options&.additional_body_parameters || {}) }.compact
              end
              req.url "#{@request_client.get_url(environment: admin,
                                                 request_options: request_options)}/points/#{system_id}/boosts"
            end
            TrophyApiClient::DeletePointsBoostsResponse.from_json(json_object: response.body)
          end
        end

        # Update multiple points boosts.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::PATCH_POINTS_BOOSTS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::PatchPointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.update(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Updated Boost Name", multiplier: 3 }])
        def update(system_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
              req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              unless request_options.nil? || request_options&.additional_query_parameters.nil?
                req.params = { **(request_options&.additional_query_parameters || {}) }.compact
              end
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: admin,
                                                 request_options: request_options)}/points/#{system_id}/boosts"
            end
            TrophyApiClient::PatchPointsBoostsResponse.from_json(json_object: response.body)
          end
        end

        # Get a single points boost by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param id [String] The UUID of the points boost.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsBoost]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.get(system_id: "550e8400-e29b-41d4-a716-446655440000", id: "660f9500-f30c-42e5-b827-557766550001")
        def get(system_id:, id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
              req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              unless request_options.nil? || request_options&.additional_query_parameters.nil?
                req.params = { **(request_options&.additional_query_parameters || {}) }.compact
              end
              unless request_options.nil? || request_options&.additional_body_parameters.nil?
                req.body = { **(request_options&.additional_body_parameters || {}) }.compact
              end
              req.url "#{@request_client.get_url(environment: admin,
                                                 request_options: request_options)}/points/#{system_id}/boosts/#{id}"
            end
            TrophyApiClient::AdminPointsBoost.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
