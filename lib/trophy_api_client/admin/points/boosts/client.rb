# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/create_points_boosts_request_boosts_item"
require_relative "../../../types/create_points_boosts_response"
require_relative "../../../types/archive_points_boosts_response"
require "async"

module TrophyApiClient
  module Admin
    module Points
      class BoostsClient
        # @return [TrophyApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Points::BoostsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Create points boosts for multiple users.
        #
        # @param system_key [String] The key of the points system to create boosts for.
        # @param boosts [Array<Hash>] Array of boosts to create. Maximum 1,000 boosts per request.Request of type Array<TrophyApiClient::Admin::Points::Boosts::CreatePointsBoostsRequestBoostsItem>, as a Hash
        #   * :user_id (String)
        #   * :name (String)
        #   * :start (String)
        #   * :end_ (String)
        #   * :multiplier (Float)
        #   * :rounding (TrophyApiClient::Admin::Points::Boosts::CreatePointsBoostsRequestBoostsItemRounding)
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.create(system_key: "xp", boosts: [{ user_id: "user-123", name: "Double XP Weekend", start: "2024-01-01", end_: "2024-01-03", multiplier: 2 }, { user_id: "user-456", name: "Holiday Bonus", start: "2024-12-25", multiplier: 1.5, rounding: UP }])
        def create(system_key:, boosts:, request_options: nil)
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              systemKey: system_key,
              boosts: boosts
            }.compact
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points/boosts"
          end
          TrophyApiClient::CreatePointsBoostsResponse.from_json(json_object: response.body)
        end

        # Archive multiple points boosts by ID.
        #
        # @param ids [String] A list of up to 100 boost IDs.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::ArchivePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.batch_archive
        def batch_archive(ids: nil, request_options: nil)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points/boosts"
          end
          TrophyApiClient::ArchivePointsBoostsResponse.from_json(json_object: response.body)
        end

        # Archive a points boost by ID.
        #
        # @param id [String] The UUID of the points boost to archive
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.archive(id: "id")
        def archive(id:, request_options: nil)
          @request_client.conn.delete do |req|
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
                                               request_options: request_options)}/points/boosts/#{id}"
          end
        end
      end

      class AsyncBoostsClient
        # @return [TrophyApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Points::AsyncBoostsClient]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Create points boosts for multiple users.
        #
        # @param system_key [String] The key of the points system to create boosts for.
        # @param boosts [Array<Hash>] Array of boosts to create. Maximum 1,000 boosts per request.Request of type Array<TrophyApiClient::Admin::Points::Boosts::CreatePointsBoostsRequestBoostsItem>, as a Hash
        #   * :user_id (String)
        #   * :name (String)
        #   * :start (String)
        #   * :end_ (String)
        #   * :multiplier (Float)
        #   * :rounding (TrophyApiClient::Admin::Points::Boosts::CreatePointsBoostsRequestBoostsItemRounding)
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::CreatePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.create(system_key: "xp", boosts: [{ user_id: "user-123", name: "Double XP Weekend", start: "2024-01-01", end_: "2024-01-03", multiplier: 2 }, { user_id: "user-456", name: "Holiday Bonus", start: "2024-12-25", multiplier: 1.5, rounding: UP }])
        def create(system_key:, boosts:, request_options: nil)
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
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                systemKey: system_key,
                boosts: boosts
              }.compact
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points/boosts"
            end
            TrophyApiClient::CreatePointsBoostsResponse.from_json(json_object: response.body)
          end
        end

        # Archive multiple points boosts by ID.
        #
        # @param ids [String] A list of up to 100 boost IDs.
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [TrophyApiClient::ArchivePointsBoostsResponse]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.batch_archive
        def batch_archive(ids: nil, request_options: nil)
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
              req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/points/boosts"
            end
            TrophyApiClient::ArchivePointsBoostsResponse.from_json(json_object: response.body)
          end
        end

        # Archive a points boost by ID.
        #
        # @param id [String] The UUID of the points boost to archive
        # @param request_options [TrophyApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = TrophyApiClient::Client.new(
        #    base_url: "https://api.example.com",
        #    environment: TrophyApiClient::Environment::PRODUCTION,
        #    api_key: "YOUR_API_KEY"
        #  )
        #  api.admin.points.boosts.archive(id: "id")
        def archive(id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
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
                                                 request_options: request_options)}/points/boosts/#{id}"
            end
          end
        end
      end
    end
  end
end
