# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/restore_streaks_response"
require "async"

module TrophyApiClient
  module Admin
    class StreaksClient
      # @return [TrophyApiClient::RequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::StreaksClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Restore streaks for multiple users to the maximum length in the last 90 days (in
      #  the case of daily streaks), one year (in the case of weekly streaks), or two
      #  years (in the case of monthly streaks).
      #
      # @param user_ids [Array<String>] Array of user IDs to restore streaks for. Maximum 100 users per request.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::RestoreStreaksResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.streaks.restore(user_ids: ["user-123", "user-456"])
      def restore(user_ids:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), userIds: user_ids }.compact
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/streaks/restore"
        end
        TrophyApiClient::RestoreStreaksResponse.from_json(json_object: response.body)
      end
    end

    class AsyncStreaksClient
      # @return [TrophyApiClient::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncStreaksClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Restore streaks for multiple users to the maximum length in the last 90 days (in
      #  the case of daily streaks), one year (in the case of weekly streaks), or two
      #  years (in the case of monthly streaks).
      #
      # @param user_ids [Array<String>] Array of user IDs to restore streaks for. Maximum 100 users per request.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::RestoreStreaksResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.streaks.restore(user_ids: ["user-123", "user-456"])
      def restore(user_ids:, request_options: nil)
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
            req.body = { **(request_options&.additional_body_parameters || {}), userIds: user_ids }.compact
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/streaks/restore"
          end
          TrophyApiClient::RestoreStreaksResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
