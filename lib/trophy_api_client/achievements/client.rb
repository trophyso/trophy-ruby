# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/achievement_with_stats_response"
require "json"
require_relative "../types/upserted_user"
require_relative "../types/achievement_completion_response"
require "async"

module TrophyApiClient
  class AchievementsClient
    # @return [TrophyApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::RequestClient]
    # @return [TrophyApiClient::AchievementsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get all achievements and their completion stats.
    #
    # @param user_attributes [String] Optional colon-delimited user attributes in the format
    #  attribute:value,attribute:value. Only achievements accessible to a user with the
    #  provided attributes will be returned.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::AchievementWithStatsResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.achievements.all(user_attributes: "plan-type:premium,region:us-east")
    def all(user_attributes: nil, request_options: nil)
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
        req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/achievements"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::AchievementWithStatsResponse.from_json(json_object: item)
      end
    end

    # Mark an achievement as completed for a user.
    #
    # @param key [String] Unique reference of the achievement as set when created.
    # @param user [Hash] The user that completed the achievement.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::AchievementCompletionResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.achievements.complete(key: "finish-onboarding", user: { email: "user@example.com", name: "User", tz: "Europe/London", device_tokens: ["token1", "token2"], subscribe_to_emails: true, attributes: { "department": "engineering", "role": "developer" }, id: "user-id" })
    def complete(key:, user:, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), user: user }.compact
        req.url "#{@request_client.get_url(environment: api,
                                           request_options: request_options)}/achievements/#{key}/complete"
      end
      TrophyApiClient::AchievementCompletionResponse.from_json(json_object: response.body)
    end
  end

  class AsyncAchievementsClient
    # @return [TrophyApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::AsyncRequestClient]
    # @return [TrophyApiClient::AsyncAchievementsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Get all achievements and their completion stats.
    #
    # @param user_attributes [String] Optional colon-delimited user attributes in the format
    #  attribute:value,attribute:value. Only achievements accessible to a user with the
    #  provided attributes will be returned.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::AchievementWithStatsResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.achievements.all(user_attributes: "plan-type:premium,region:us-east")
    def all(user_attributes: nil, request_options: nil)
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
          req.url "#{@request_client.get_url(environment: api, request_options: request_options)}/achievements"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::AchievementWithStatsResponse.from_json(json_object: item)
        end
      end
    end

    # Mark an achievement as completed for a user.
    #
    # @param key [String] Unique reference of the achievement as set when created.
    # @param user [Hash] The user that completed the achievement.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::AchievementCompletionResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::PRODUCTION,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.achievements.complete(key: "finish-onboarding", user: { email: "user@example.com", name: "User", tz: "Europe/London", device_tokens: ["token1", "token2"], subscribe_to_emails: true, attributes: { "department": "engineering", "role": "developer" }, id: "user-id" })
    def complete(key:, user:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), user: user }.compact
          req.url "#{@request_client.get_url(environment: api,
                                             request_options: request_options)}/achievements/#{key}/complete"
        end
        TrophyApiClient::AchievementCompletionResponse.from_json(json_object: response.body)
      end
    end
  end
end
