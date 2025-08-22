# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/streaks_rankings_request_type"
require_relative "../types/streak_ranking_user"
require "json"
require "async"

module TrophyApiClient
  class StreaksClient
    # @return [TrophyApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::RequestClient]
    # @return [TrophyApiClient::StreaksClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get the top users by streak length (active or longest).
    #
    # @param limit [Integer] Number of users to return. Must be between 1 and 100.
    # @param type [TrophyApiClient::Streaks::StreaksRankingsRequestType] Whether to rank users by active streaks or longest streaks ever achieved.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::StreakRankingUser>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.streaks.rankings
    def rankings(limit: nil, type: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "type": type }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/streaks/rankings"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::StreakRankingUser.from_json(json_object: item)
      end
    end
  end

  class AsyncStreaksClient
    # @return [TrophyApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::AsyncRequestClient]
    # @return [TrophyApiClient::AsyncStreaksClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get the top users by streak length (active or longest).
    #
    # @param limit [Integer] Number of users to return. Must be between 1 and 100.
    # @param type [TrophyApiClient::Streaks::StreaksRankingsRequestType] Whether to rank users by active streaks or longest streaks ever achieved.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::StreakRankingUser>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.streaks.rankings
    def rankings(limit: nil, type: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "type": type }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/streaks/rankings"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::StreakRankingUser.from_json(json_object: item)
        end
      end
    end
  end
end
