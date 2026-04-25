# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/list_leaderboards_response"
require "json"
require_relative "../../types/create_leaderboards_request"
require_relative "../../types/create_leaderboards_response"
require_relative "../../types/delete_leaderboards_response"
require_relative "../../types/update_leaderboards_request"
require_relative "../../types/update_leaderboards_response"
require_relative "../../types/admin_leaderboard"
require "async"

module TrophyApiClient
  module Admin
    class LeaderboardsClient
      # @return [TrophyApiClient::RequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::LeaderboardsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List leaderboards.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_LEADERBOARDS_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.list(limit: 1, skip: 1)
      def list(limit: nil, skip: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "skip": skip }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::AdminLeaderboard.from_json(json_object: item)
        end
      end

      # Create leaderboards. Maximum 100 leaderboards per request.
      #
      # @param request [TrophyApiClient::CREATE_LEADERBOARDS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateLeaderboardsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.create(request: [{ name: "Revenue Champions", key: "revenue-champions", status: INACTIVE, rank_by: METRIC, metric_id: "550e8400-e29b-41d4-a716-446655440000", max_participants: 100, start: "2026-04-20", breakdown_attributes: ["550e8400-e29b-41d4-a716-446655440010"], run_unit: MONTH, run_interval: 1 }, { name: "Streak Legends", key: "streak-legends", status: SCHEDULED, rank_by: STREAK, start: "2026-04-27" }])
      def create(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
        end
        TrophyApiClient::CreateLeaderboardsResponse.from_json(json_object: response.body)
      end

      # Delete leaderboards by ID.
      #
      # @param ids [String] Leaderboard IDs to delete. Repeat the query param or provide a comma-separated
      #  list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteLeaderboardsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.delete
      def delete(ids: nil, request_options: nil)
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
        end
        TrophyApiClient::DeleteLeaderboardsResponse.from_json(json_object: response.body)
      end

      # Update leaderboards by ID. Updating `status` behaves the same as activating,
      #  scheduling, deactivating, or finishing a leaderboard in the dashboard.
      #
      # @param request [TrophyApiClient::UPDATE_LEADERBOARDS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateLeaderboardsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440100", name: "Monthly Revenue Champions", description: "Ranked by monthly revenue", status: ACTIVE }, { id: "550e8400-e29b-41d4-a716-446655440101", status: FINISHED }])
      def update(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
        end
        TrophyApiClient::UpdateLeaderboardsResponse.from_json(json_object: response.body)
      end

      # Get a leaderboard by ID.
      #
      # @param id [String] The UUID of the leaderboard to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::AdminLeaderboard]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.get(id: "550e8400-e29b-41d4-a716-446655440100")
      def get(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards/#{id}"
        end
        TrophyApiClient::AdminLeaderboard.from_json(json_object: response.body)
      end
    end

    class AsyncLeaderboardsClient
      # @return [TrophyApiClient::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncLeaderboardsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List leaderboards.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_LEADERBOARDS_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.list(limit: 1, skip: 1)
      def list(limit: nil, skip: nil, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::AdminLeaderboard.from_json(json_object: item)
          end
        end
      end

      # Create leaderboards. Maximum 100 leaderboards per request.
      #
      # @param request [TrophyApiClient::CREATE_LEADERBOARDS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateLeaderboardsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.create(request: [{ name: "Revenue Champions", key: "revenue-champions", status: INACTIVE, rank_by: METRIC, metric_id: "550e8400-e29b-41d4-a716-446655440000", max_participants: 100, start: "2026-04-20", breakdown_attributes: ["550e8400-e29b-41d4-a716-446655440010"], run_unit: MONTH, run_interval: 1 }, { name: "Streak Legends", key: "streak-legends", status: SCHEDULED, rank_by: STREAK, start: "2026-04-27" }])
      def create(request:, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
          end
          TrophyApiClient::CreateLeaderboardsResponse.from_json(json_object: response.body)
        end
      end

      # Delete leaderboards by ID.
      #
      # @param ids [String] Leaderboard IDs to delete. Repeat the query param or provide a comma-separated
      #  list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteLeaderboardsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.delete
      def delete(ids: nil, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
          end
          TrophyApiClient::DeleteLeaderboardsResponse.from_json(json_object: response.body)
        end
      end

      # Update leaderboards by ID. Updating `status` behaves the same as activating,
      #  scheduling, deactivating, or finishing a leaderboard in the dashboard.
      #
      # @param request [TrophyApiClient::UPDATE_LEADERBOARDS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateLeaderboardsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440100", name: "Monthly Revenue Champions", description: "Ranked by monthly revenue", status: ACTIVE }, { id: "550e8400-e29b-41d4-a716-446655440101", status: FINISHED }])
      def update(request:, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/leaderboards"
          end
          TrophyApiClient::UpdateLeaderboardsResponse.from_json(json_object: response.body)
        end
      end

      # Get a leaderboard by ID.
      #
      # @param id [String] The UUID of the leaderboard to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::AdminLeaderboard]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.leaderboards.get(id: "550e8400-e29b-41d4-a716-446655440100")
      def get(id:, request_options: nil)
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
                                               request_options: request_options)}/leaderboards/#{id}"
          end
          TrophyApiClient::AdminLeaderboard.from_json(json_object: response.body)
        end
      end
    end
  end
end
