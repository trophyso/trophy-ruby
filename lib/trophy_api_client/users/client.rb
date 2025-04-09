# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/upserted_user"
require_relative "../types/user"
require_relative "../types/updated_user"
require_relative "../types/metric_response"
require "json"
require_relative "../types/multi_stage_achievement_response"
require "async"

module TrophyApiClient
  class UsersClient
    # @return [TrophyApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::RequestClient]
    # @return [TrophyApiClient::UsersClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Identify a new user.
    #
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :subscribe_to_emails (Boolean)
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.create(request: { id: "user-id" })
    def create(request:, request_options: nil)
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
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/users"
      end
      TrophyApiClient::User.from_json(json_object: response.body)
    end

    # Get a single user.
    #
    # @param id [String] ID of the user to get.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.get(id: "userId")
    def get(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}"
      end
      TrophyApiClient::User.from_json(json_object: response.body)
    end

    # Update a user.
    #
    # @param id [String] ID of the user to update.
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpdatedUser, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :subscribe_to_emails (Boolean)
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.update(id: "id", request: { email: "user@example.com", tz: "Europe/London" })
    def update(id:, request:, request_options: nil)
      response = @request_client.conn.patch do |req|
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
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}"
      end
      TrophyApiClient::User.from_json(json_object: response.body)
    end

    # Get a single user's progress against all active metrics.
    #
    # @param id [String] ID of the user
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::MetricResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.allmetrics(id: "userId")
    def allmetrics(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/metrics"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::MetricResponse.from_json(json_object: item)
      end
    end

    # Get a user's progress against a single active metric.
    #
    # @param id [String] ID of the user.
    # @param key [String] Unique key of the metric.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::MetricResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.singlemetric(id: "userId", key: "key")
    def singlemetric(id:, key:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/metrics/#{key}"
      end
      TrophyApiClient::MetricResponse.from_json(json_object: response.body)
    end

    # Get all of a user's completed achievements.
    #
    # @param id [String] ID of the user.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::MultiStageAchievementResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.allachievements(id: "userId")
    def allachievements(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/achievements"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::MultiStageAchievementResponse.from_json(json_object: item)
      end
    end
  end

  class AsyncUsersClient
    # @return [TrophyApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [TrophyApiClient::AsyncRequestClient]
    # @return [TrophyApiClient::AsyncUsersClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Identify a new user.
    #
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :subscribe_to_emails (Boolean)
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.create(request: { id: "user-id" })
    def create(request:, request_options: nil)
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/users"
        end
        TrophyApiClient::User.from_json(json_object: response.body)
      end
    end

    # Get a single user.
    #
    # @param id [String] ID of the user to get.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.get(id: "userId")
    def get(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}"
        end
        TrophyApiClient::User.from_json(json_object: response.body)
      end
    end

    # Update a user.
    #
    # @param id [String] ID of the user to update.
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpdatedUser, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :subscribe_to_emails (Boolean)
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.update(id: "id", request: { email: "user@example.com", tz: "Europe/London" })
    def update(id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}"
        end
        TrophyApiClient::User.from_json(json_object: response.body)
      end
    end

    # Get a single user's progress against all active metrics.
    #
    # @param id [String] ID of the user
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::MetricResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.allmetrics(id: "userId")
    def allmetrics(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/metrics"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::MetricResponse.from_json(json_object: item)
        end
      end
    end

    # Get a user's progress against a single active metric.
    #
    # @param id [String] ID of the user.
    # @param key [String] Unique key of the metric.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::MetricResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.singlemetric(id: "userId", key: "key")
    def singlemetric(id:, key:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/metrics/#{key}"
        end
        TrophyApiClient::MetricResponse.from_json(json_object: response.body)
      end
    end

    # Get all of a user's completed achievements.
    #
    # @param id [String] ID of the user.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::MultiStageAchievementResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.allachievements(id: "userId")
    def allachievements(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/achievements"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::MultiStageAchievementResponse.from_json(json_object: item)
        end
      end
    end
  end
end
