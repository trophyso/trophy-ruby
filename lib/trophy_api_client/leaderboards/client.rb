# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/leaderboard_response"
require "json"
require_relative "../types/leaderboard_response_with_rankings"
require "async"

module TrophyApiClient
  class LeaderboardsClient
    # @return [TrophyApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::RequestClient]
    # @return [TrophyApiClient::LeaderboardsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get all active leaderboards for your organization.
    #
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::LeaderboardResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.leaderboards.all
    def all(request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/leaderboards"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::LeaderboardResponse.from_json(json_object: item)
      end
    end

    # Get a specific leaderboard by its key.
    #
    # @param key [String] Unique key of the leaderboard as set when created.
    # @param offset [Integer] Number of rankings to skip for pagination.
    # @param limit [Integer] Maximum number of rankings to return.
    # @param run [String] Specific run date in YYYY-MM-DD format. If not provided, returns the current
    #  run.
    # @param user_id [String] When provided, offset is relative to this user's position on the leaderboard. If
    #  the user is not found in the leaderboard, returns empty rankings array.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::LeaderboardResponseWithRankings]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.leaderboards.get(
    #    key: "weekly-words",
    #    run: "2025-01-15",
    #    user_id: "user-123"
    #  )
    def get(key:, offset: nil, limit: nil, run: nil, user_id: nil, request_options: nil)
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
          "offset": offset,
          "limit": limit,
          "run": run,
          "userId": user_id
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/leaderboards/#{key}"
      end
      TrophyApiClient::LeaderboardResponseWithRankings.from_json(json_object: response.body)
    end
  end

  class AsyncLeaderboardsClient
    # @return [TrophyApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::AsyncRequestClient]
    # @return [TrophyApiClient::AsyncLeaderboardsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get all active leaderboards for your organization.
    #
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::LeaderboardResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.leaderboards.all
    def all(request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/leaderboards"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::LeaderboardResponse.from_json(json_object: item)
        end
      end
    end

    # Get a specific leaderboard by its key.
    #
    # @param key [String] Unique key of the leaderboard as set when created.
    # @param offset [Integer] Number of rankings to skip for pagination.
    # @param limit [Integer] Maximum number of rankings to return.
    # @param run [String] Specific run date in YYYY-MM-DD format. If not provided, returns the current
    #  run.
    # @param user_id [String] When provided, offset is relative to this user's position on the leaderboard. If
    #  the user is not found in the leaderboard, returns empty rankings array.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::LeaderboardResponseWithRankings]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.leaderboards.get(
    #    key: "weekly-words",
    #    run: "2025-01-15",
    #    user_id: "user-123"
    #  )
    def get(key:, offset: nil, limit: nil, run: nil, user_id: nil, request_options: nil)
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
            "offset": offset,
            "limit": limit,
            "run": run,
            "userId": user_id
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/leaderboards/#{key}"
        end
        TrophyApiClient::LeaderboardResponseWithRankings.from_json(json_object: response.body)
      end
    end
  end
end
