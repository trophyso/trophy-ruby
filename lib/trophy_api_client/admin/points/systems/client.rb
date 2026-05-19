# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "../../../types/list_points_systems_response"
require "json"
require_relative "../../../types/create_points_systems_request"
require_relative "../../../types/create_points_systems_response"
require_relative "../../../types/delete_points_systems_response"
require_relative "../../../types/update_points_systems_request"
require_relative "../../../types/update_points_systems_response"
require_relative "../../../types/admin_points_system"
require "async"

module TrophyApiClient
  module Admin
    module Points
      class SystemsClient
        # @return [TrophyApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Points::SystemsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points systems.
        #
        # @param limit [Integer] Number of records to return.
        # @param skip [Integer] Number of records to skip from the start of the list.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_SYSTEMS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.list(limit: 1, skip: 1)
        def list(limit: nil, skip: nil, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::AdminPointsSystem.from_json(json_object: item)
          end
        end

        # Create points systems. Optionally include sub-entities (levels, boosts,
        #  triggers) in each system payload to create them alongside the system.
        #
        # @param request [TrophyApiClient::CREATE_POINTS_SYSTEMS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsSystemsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.create(request: [{ name: "XP", key: "xp", description: "Experience points", levels: [{ name: "Bronze", key: "bronze", points: 100 }, { name: "Silver", key: "silver", points: 500 }] }])
        def create(request:, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
          end
          TrophyApiClient::CreatePointsSystemsResponse.from_json(json_object: response.body)
        end

        # Delete (archive) points systems by ID.
        #
        # @param ids [String] The IDs of the points systems to delete.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsSystemsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.delete
        def delete(ids: nil, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
          end
          TrophyApiClient::DeletePointsSystemsResponse.from_json(json_object: response.body)
        end

        # Update points systems by ID.
        #
        # @param request [TrophyApiClient::UPDATE_POINTS_SYSTEMS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::UpdatePointsSystemsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "New Name" }])
        def update(request:, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
          end
          TrophyApiClient::UpdatePointsSystemsResponse.from_json(json_object: response.body)
        end

        # Get a points system by ID.
        #
        # @param id [String] The ID of the points system.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsSystem]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.get(id: "550e8400-e29b-41d4-a716-446655440000")
        def get(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points/#{id}"
          end
          TrophyApiClient::AdminPointsSystem.from_json(json_object: response.body)
        end
      end

      class AsyncSystemsClient
        # @return [TrophyApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Points::AsyncSystemsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points systems.
        #
        # @param limit [Integer] Number of records to return.
        # @param skip [Integer] Number of records to skip from the start of the list.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_SYSTEMS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.list(limit: 1, skip: 1)
        def list(limit: nil, skip: nil, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              TrophyApiClient::AdminPointsSystem.from_json(json_object: item)
            end
          end
        end

        # Create points systems. Optionally include sub-entities (levels, boosts,
        #  triggers) in each system payload to create them alongside the system.
        #
        # @param request [TrophyApiClient::CREATE_POINTS_SYSTEMS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsSystemsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.create(request: [{ name: "XP", key: "xp", description: "Experience points", levels: [{ name: "Bronze", key: "bronze", points: 100 }, { name: "Silver", key: "silver", points: 500 }] }])
        def create(request:, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
            end
            TrophyApiClient::CreatePointsSystemsResponse.from_json(json_object: response.body)
          end
        end

        # Delete (archive) points systems by ID.
        #
        # @param ids [String] The IDs of the points systems to delete.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsSystemsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.delete
        def delete(ids: nil, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
            end
            TrophyApiClient::DeletePointsSystemsResponse.from_json(json_object: response.body)
          end
        end

        # Update points systems by ID.
        #
        # @param request [TrophyApiClient::UPDATE_POINTS_SYSTEMS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::UpdatePointsSystemsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "New Name" }])
        def update(request:, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points"
            end
            TrophyApiClient::UpdatePointsSystemsResponse.from_json(json_object: response.body)
          end
        end

        # Get a points system by ID.
        #
        # @param id [String] The ID of the points system.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsSystem]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.systems.get(id: "550e8400-e29b-41d4-a716-446655440000")
        def get(id:, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points/#{id}"
            end
            TrophyApiClient::AdminPointsSystem.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
