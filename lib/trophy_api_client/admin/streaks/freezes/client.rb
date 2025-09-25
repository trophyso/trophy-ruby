# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/create_streak_freezes_request_freezes_item"
require_relative "../../../types/create_streak_freezes_response"
require "async"

module TrophyApiClient
  module Admin
    module Streaks
      class FreezesClient
        # @return [TrophyApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Streaks::FreezesClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Create streak freezes for multiple users.
        #
        # @param freezes [Array<Hash>] Array of freezes to create. Maximum 1,000 freezes per request.Request of type Array<TrophyApiClient::Admin::Streaks::Freezes::CreateStreakFreezesRequestFreezesItem>, as a Hash
        #   * :user_id (String)
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreateStreakFreezesResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.streaks.freezes.create(freezes: [{ user_id: "user-123" }, { user_id: "user-456" }, { user_id: "user-123" }])
        def create(freezes:, request_options: nil)
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
            req.body = { **(request_options&.additional_body_parameters || {}), freezes: freezes }.compact
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/streaks/freezes"
          end
          TrophyApiClient::CreateStreakFreezesResponse.from_json(json_object: response.body)
        end
      end

      class AsyncFreezesClient
        # @return [TrophyApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Streaks::AsyncFreezesClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Create streak freezes for multiple users.
        #
        # @param freezes [Array<Hash>] Array of freezes to create. Maximum 1,000 freezes per request.Request of type Array<TrophyApiClient::Admin::Streaks::Freezes::CreateStreakFreezesRequestFreezesItem>, as a Hash
        #   * :user_id (String)
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreateStreakFreezesResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.streaks.freezes.create(freezes: [{ user_id: "user-123" }, { user_id: "user-456" }, { user_id: "user-123" }])
        def create(freezes:, request_options: nil)
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
              req.body = { **(request_options&.additional_body_parameters || {}), freezes: freezes }.compact
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/streaks/freezes"
            end
            TrophyApiClient::CreateStreakFreezesResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
