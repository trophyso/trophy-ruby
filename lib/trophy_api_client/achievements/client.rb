# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/event_request_user"
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

    # Mark an achievement as completed for a user.
    #
    # @param key [String] Unique reference of the achievement as set when created.
    # @param user [Hash] The user that completed the achievement.Request of type TrophyApiClient::EventRequestUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::AchievementCompletionResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.achievements.complete(key: "finish-onboarding", user: { id: "18", email: "jk.rowling@harrypotter.com", tz: "Europe/London" })
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
        req.url "#{@request_client.get_url(request_options: request_options)}/achievements/#{key}/complete"
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

    # Mark an achievement as completed for a user.
    #
    # @param key [String] Unique reference of the achievement as set when created.
    # @param user [Hash] The user that completed the achievement.Request of type TrophyApiClient::EventRequestUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::AchievementCompletionResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.achievements.complete(key: "finish-onboarding", user: { id: "18", email: "jk.rowling@harrypotter.com", tz: "Europe/London" })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/achievements/#{key}/complete"
        end
        TrophyApiClient::AchievementCompletionResponse.from_json(json_object: response.body)
      end
    end
  end
end
