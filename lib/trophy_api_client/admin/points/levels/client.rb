# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "../../../types/list_points_levels_response"
require "json"
require_relative "../../../types/create_points_levels_request"
require_relative "../../../types/create_points_levels_response"
require_relative "../../../types/delete_points_levels_response"
require_relative "../../../types/patch_points_levels_request"
require_relative "../../../types/patch_points_levels_response"
require_relative "../../../types/admin_points_level"
require "async"

module TrophyApiClient
  module Admin
    module Points
      class LevelsClient
        # @return [TrophyApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Points::LevelsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points levels for a system.
        #
        # @param system_id [String] The UUID of the points system.
        # @param limit [Integer] Number of records to return.
        # @param skip [Integer] Number of records to skip from the start of the list.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_LEVELS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.list(
        #    system_id: "550e8400-e29b-41d4-a716-446655440000",
        #    limit: 1,
        #    skip: 1
        #  )
        def list(system_id:, limit: nil, skip: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                               request_options: request_options)}/points/#{system_id}/levels"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::AdminPointsLevel.from_json(json_object: item)
          end
        end

        # Create points levels. Maximum 100 levels per request.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::CREATE_POINTS_LEVELS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsLevelsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.create(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ name: "Bronze", key: "bronze", points: 100 }])
        def create(system_id:, request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                               request_options: request_options)}/points/#{system_id}/levels"
          end
          TrophyApiClient::CreatePointsLevelsResponse.from_json(json_object: response.body)
        end

        # Delete multiple points levels by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param ids [String] Comma-separated list of level UUIDs to delete.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsLevelsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.delete
        def delete(system_id:, ids: nil, request_options: nil)
          response = @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                               request_options: request_options)}/points/#{system_id}/levels"
          end
          TrophyApiClient::DeletePointsLevelsResponse.from_json(json_object: response.body)
        end

        # Update multiple points levels. Each item must include an ID. `key` cannot be
        #  changed.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::PATCH_POINTS_LEVELS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::PatchPointsLevelsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.update(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ id: "550e8400-e29b-41d4-a716-446655440000" }])
        def update(system_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                               request_options: request_options)}/points/#{system_id}/levels"
          end
          TrophyApiClient::PatchPointsLevelsResponse.from_json(json_object: response.body)
        end

        # Get a single points level by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param id [String] The UUID of the points level.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsLevel]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.get(system_id: "550e8400-e29b-41d4-a716-446655440000", id: "660f9500-f30c-42e5-b827-557766550001")
        def get(system_id:, id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                               request_options: request_options)}/points/#{system_id}/levels/#{id}"
          end
          TrophyApiClient::AdminPointsLevel.from_json(json_object: response.body)
        end
      end

      class AsyncLevelsClient
        # @return [TrophyApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Points::AsyncLevelsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # List points levels for a system.
        #
        # @param system_id [String] The UUID of the points system.
        # @param limit [Integer] Number of records to return.
        # @param skip [Integer] Number of records to skip from the start of the list.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::LIST_POINTS_LEVELS_RESPONSE]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.list(
        #    system_id: "550e8400-e29b-41d4-a716-446655440000",
        #    limit: 1,
        #    skip: 1
        #  )
        def list(system_id:, limit: nil, skip: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                                 request_options: request_options)}/points/#{system_id}/levels"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              TrophyApiClient::AdminPointsLevel.from_json(json_object: item)
            end
          end
        end

        # Create points levels. Maximum 100 levels per request.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::CREATE_POINTS_LEVELS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsLevelsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.create(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ name: "Bronze", key: "bronze", points: 100 }])
        def create(system_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                                 request_options: request_options)}/points/#{system_id}/levels"
            end
            TrophyApiClient::CreatePointsLevelsResponse.from_json(json_object: response.body)
          end
        end

        # Delete multiple points levels by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param ids [String] Comma-separated list of level UUIDs to delete.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::DeletePointsLevelsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.delete
        def delete(system_id:, ids: nil, request_options: nil)
          Async do
            response = @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                                 request_options: request_options)}/points/#{system_id}/levels"
            end
            TrophyApiClient::DeletePointsLevelsResponse.from_json(json_object: response.body)
          end
        end

        # Update multiple points levels. Each item must include an ID. `key` cannot be
        #  changed.
        #
        # @param system_id [String] The UUID of the points system.
        # @param request [TrophyApiClient::PATCH_POINTS_LEVELS_REQUEST]
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::PatchPointsLevelsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.update(system_id: "550e8400-e29b-41d4-a716-446655440000", request: [{ id: "550e8400-e29b-41d4-a716-446655440000" }])
        def update(system_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                                 request_options: request_options)}/points/#{system_id}/levels"
            end
            TrophyApiClient::PatchPointsLevelsResponse.from_json(json_object: response.body)
          end
        end

        # Get a single points level by ID.
        #
        # @param system_id [String] The UUID of the points system.
        # @param id [String] The UUID of the points level.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::AdminPointsLevel]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.levels.get(system_id: "550e8400-e29b-41d4-a716-446655440000", id: "660f9500-f30c-42e5-b827-557766550001")
        def get(system_id:, id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
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
                                                 request_options: request_options)}/points/#{system_id}/levels/#{id}"
            end
            TrophyApiClient::AdminPointsLevel.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
