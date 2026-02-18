# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/points_summary_response"
require "json"
require_relative "../types/points_system_response"
require_relative "../types/points_boost"
require "async"

module TrophyApiClient
  class PointsClient
    # @return [TrophyApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::RequestClient]
    # @return [TrophyApiClient::PointsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get a breakdown of the number of users with points in each range.
    #
    # @param key [String] Key of the points system.
    # @param user_attributes [String] Optional colon-delimited user attribute filters in the format
    #  attribute:value,attribute:value. Only users matching ALL specified attributes
    #  will be included in the points breakdown.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::POINTS_SUMMARY_RESPONSE]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.summary(key: "points-system-key", user_attributes: "plan-type:premium,region:us-east")
    def summary(key:, user_attributes: nil, request_options: nil)
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
          "userAttributes": user_attributes
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/points/#{key}/summary"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::PointsRange.from_json(json_object: item)
      end
    end

    # Get a points system with its triggers.
    #
    # @param key [String] Key of the points system.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::PointsSystemResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.system(key: "points-system-key")
    def system(key:, request_options: nil)
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
        req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/points/#{key}"
      end
      TrophyApiClient::PointsSystemResponse.from_json(json_object: response.body)
    end

    # Get all global boosts for a points system. Finished boosts are excluded by
    #  default.
    #
    # @param key [String] Key of the points system.
    # @param include_finished [Boolean] When set to 'true', boosts that have finished (past their end date) will be
    #  included in the response. By default, finished boosts are excluded.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::PointsBoost>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.boosts(key: "points-system-key", include_finished: true)
    def boosts(key:, include_finished: nil, request_options: nil)
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
          "includeFinished": include_finished
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/points/#{key}/boosts"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::PointsBoost.from_json(json_object: item)
      end
    end
  end

  class AsyncPointsClient
    # @return [TrophyApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::AsyncRequestClient]
    # @return [TrophyApiClient::AsyncPointsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get a breakdown of the number of users with points in each range.
    #
    # @param key [String] Key of the points system.
    # @param user_attributes [String] Optional colon-delimited user attribute filters in the format
    #  attribute:value,attribute:value. Only users matching ALL specified attributes
    #  will be included in the points breakdown.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::POINTS_SUMMARY_RESPONSE]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.summary(key: "points-system-key", user_attributes: "plan-type:premium,region:us-east")
    def summary(key:, user_attributes: nil, request_options: nil)
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
            "userAttributes": user_attributes
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/points/#{key}/summary"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::PointsRange.from_json(json_object: item)
        end
      end
    end

    # Get a points system with its triggers.
    #
    # @param key [String] Key of the points system.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::PointsSystemResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.system(key: "points-system-key")
    def system(key:, request_options: nil)
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
          req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/points/#{key}"
        end
        TrophyApiClient::PointsSystemResponse.from_json(json_object: response.body)
      end
    end

    # Get all global boosts for a points system. Finished boosts are excluded by
    #  default.
    #
    # @param key [String] Key of the points system.
    # @param include_finished [Boolean] When set to 'true', boosts that have finished (past their end date) will be
    #  included in the response. By default, finished boosts are excluded.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::PointsBoost>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.boosts(key: "points-system-key", include_finished: true)
    def boosts(key:, include_finished: nil, request_options: nil)
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
            "includeFinished": include_finished
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/points/#{key}/boosts"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::PointsBoost.from_json(json_object: item)
        end
      end
    end
  end
end
