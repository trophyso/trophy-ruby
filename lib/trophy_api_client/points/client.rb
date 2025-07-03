# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/points_summary_response"
require "json"
require_relative "../types/points_trigger_response"
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
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::POINTS_SUMMARY_RESPONSE]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.summary
    def summary(request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/points/summary"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::PointsRange.from_json(json_object: item)
      end
    end

    # Get all points triggers.
    #
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::PointsTriggerResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.triggers
    def triggers(request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/points/triggers"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::PointsTriggerResponse.from_json(json_object: item)
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
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::POINTS_SUMMARY_RESPONSE]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.summary
    def summary(request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/points/summary"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::PointsRange.from_json(json_object: item)
        end
      end
    end

    # Get all points triggers.
    #
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::PointsTriggerResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.points.triggers
    def triggers(request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/points/triggers"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::PointsTriggerResponse.from_json(json_object: item)
        end
      end
    end
  end
end
