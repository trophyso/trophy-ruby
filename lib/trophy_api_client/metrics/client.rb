# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/upserted_user"
require_relative "../types/event_response"
require "async"

module TrophyApiClient
  class MetricsClient
    # @return [TrophyApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::RequestClient]
    # @return [TrophyApiClient::MetricsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Increment or decrement the value of a metric for a user.
    #
    # @param key [String] Unique reference of the metric as set when created.
    # @param user [Hash] The user that triggered the event.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :subscribe_to_emails (Boolean)
    # @param value [Float] The value to add to the user's current total for the given metric.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::EventResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.metrics.event(
    #    key: "words-written",
    #    user: { email: "user@example.com", tz: "Europe/London", id: "18" },
    #    value: 750
    #  )
    def event(key:, user:, value:, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), user: user, value: value }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/metrics/#{key}/event"
      end
      TrophyApiClient::EventResponse.from_json(json_object: response.body)
    end
  end

  class AsyncMetricsClient
    # @return [TrophyApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::AsyncRequestClient]
    # @return [TrophyApiClient::AsyncMetricsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Increment or decrement the value of a metric for a user.
    #
    # @param key [String] Unique reference of the metric as set when created.
    # @param user [Hash] The user that triggered the event.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :subscribe_to_emails (Boolean)
    # @param value [Float] The value to add to the user's current total for the given metric.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::EventResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.metrics.event(
    #    key: "words-written",
    #    user: { email: "user@example.com", tz: "Europe/London", id: "18" },
    #    value: 750
    #  )
    def event(key:, user:, value:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), user: user, value: value }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/metrics/#{key}/event"
        end
        TrophyApiClient::EventResponse.from_json(json_object: response.body)
      end
    end
  end
end
