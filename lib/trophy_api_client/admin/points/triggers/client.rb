# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "../../../types/list_points_triggers_response"
require "json"
require_relative "../../../types/create_points_triggers_request"
require_relative "../../../types/create_points_triggers_response"
require_relative "../../../types/delete_points_triggers_response"
require_relative "../../../types/patch_points_triggers_request"
require_relative "../../../types/patch_points_triggers_response"
require_relative "../../../types/admin_points_trigger"
require "async"

module TrophyApiClient
  module Admin
    module Points
      class TriggersClient
        # @return [TrophyApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Points::TriggersClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points triggers for a system.
        #
        # @param system_id [String] The UUID of the points system.
        # @param limit [Integer] Maximum number of results to return (1-100, default 10).
        # @param skip [Integer] Number of results to skip for pagination (default 0).
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_TRIGGERS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.list(
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
                                               request_options: request_options)}/points/#{system_id}/triggers"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::AdminPointsTrigger.from_json(json_object: item)
          end
        end

        # Create points triggers in bulk. Maximum 100 triggers per request.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::CREATE_POINTS_TRIGGERS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsTriggersResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.create(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ type: METRIC, points: 10 }])
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
                                               request_options: request_options)}/points/#{system_id}/triggers"
          end
          TrophyApiClient::CreatePointsTriggersResponse.from_json(json_object: response.body)
        end

        # Delete (archive) points triggers by ID. Maximum 100 trigger IDs per request.
        #
        # @param system_id [String] The UUID of the points system.
        # @param ids [String] Trigger IDs to delete. Can be repeated or comma-separated.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsTriggersResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.delete
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
                                               request_options: request_options)}/points/#{system_id}/triggers"
          end
          TrophyApiClient::DeletePointsTriggersResponse.from_json(json_object: response.body)
        end

        # Update points triggers in bulk. Maximum 100 triggers per request. Only provided
        #  fields are updated; omitted fields are preserved.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::PATCH_POINTS_TRIGGERS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::PatchPointsTriggersResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.update(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ id: "id" }])
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
                                               request_options: request_options)}/points/#{system_id}/triggers"
          end
          TrophyApiClient::PatchPointsTriggersResponse.from_json(json_object: response.body)
        end

        # Get a single points trigger by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param id [String] The UUID of the points trigger.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsTrigger]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.get(system_id: "550e8400-e29b-41d4-a716-446655440000", id: "660f9500-f30c-42e5-b827-557766550001")
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
                                               request_options: request_options)}/points/#{system_id}/triggers/#{id}"
          end
          TrophyApiClient::AdminPointsTrigger.from_json(json_object: response.body)
        end
      end

      class AsyncTriggersClient
        # @return [TrophyApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Points::AsyncTriggersClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points triggers for a system.
        #
        # @param system_id [String] The UUID of the points system.
        # @param limit [Integer] Maximum number of results to return (1-100, default 10).
        # @param skip [Integer] Number of results to skip for pagination (default 0).
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_TRIGGERS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.list(
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
                                                 request_options: request_options)}/points/#{system_id}/triggers"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              TrophyApiClient::AdminPointsTrigger.from_json(json_object: item)
            end
          end
        end

        # Create points triggers in bulk. Maximum 100 triggers per request.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::CREATE_POINTS_TRIGGERS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsTriggersResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.create(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ type: METRIC, points: 10 }])
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
                                                 request_options: request_options)}/points/#{system_id}/triggers"
            end
            TrophyApiClient::CreatePointsTriggersResponse.from_json(json_object: response.body)
          end
        end

        # Delete (archive) points triggers by ID. Maximum 100 trigger IDs per request.
        #
        # @param system_id [String] The UUID of the points system.
        # @param ids [String] Trigger IDs to delete. Can be repeated or comma-separated.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsTriggersResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.delete
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
                                                 request_options: request_options)}/points/#{system_id}/triggers"
            end
            TrophyApiClient::DeletePointsTriggersResponse.from_json(json_object: response.body)
          end
        end

        # Update points triggers in bulk. Maximum 100 triggers per request. Only provided
        #  fields are updated; omitted fields are preserved.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::PATCH_POINTS_TRIGGERS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::PatchPointsTriggersResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.update(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ id: "id" }])
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
                                                 request_options: request_options)}/points/#{system_id}/triggers"
            end
            TrophyApiClient::PatchPointsTriggersResponse.from_json(json_object: response.body)
          end
        end

        # Get a single points trigger by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param id [String] The UUID of the points trigger.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsTrigger]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.triggers.get(system_id: "550e8400-e29b-41d4-a716-446655440000", id: "660f9500-f30c-42e5-b827-557766550001")
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
                                                 request_options: request_options)}/points/#{system_id}/triggers/#{id}"
            end
            TrophyApiClient::AdminPointsTrigger.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
