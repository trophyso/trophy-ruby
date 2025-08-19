# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/upserted_user"
require_relative "../types/user"
require_relative "../types/updated_user"
require_relative "../types/metric_response"
require "json"
require_relative "types/users_metric_event_summary_request_aggregation"
require_relative "types/users_metric_event_summary_response_item"
require_relative "../types/completed_achievement_response"
require_relative "../types/streak_response"
require_relative "../types/get_user_points_response"
require_relative "types/users_points_event_summary_request_aggregation"
require_relative "types/users_points_event_summary_response_item"
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

    # Create a new user.
    #
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
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

    # Identify a user.
    #
    # @param id [String] ID of the user to identify.
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpdatedUser, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.identify(id: "id", request: { email: "user@example.com", tz: "Europe/London", attributes: { "department": "engineering", "role": "developer" } })
    def identify(id:, request:, request_options: nil)
      response = @request_client.conn.put do |req|
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

    # Update a user.
    #
    # @param id [String] ID of the user to update.
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpdatedUser, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.update(id: "id", request: { email: "user@example.com", tz: "Europe/London", attributes: { "department": "engineering", "role": "developer" } })
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
    #  api.users.all_metrics(id: "userId")
    def all_metrics(id:, request_options: nil)
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
    #  api.users.single_metric(id: "userId", key: "key")
    def single_metric(id:, key:, request_options: nil)
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

    # Get a summary of metric events over time for a user.
    #
    # @param id [String] ID of the user.
    # @param key [String] Unique key of the metric.
    # @param aggregation [TrophyApiClient::Users::UsersMetricEventSummaryRequestAggregation] The time period over which to aggregate the event data.
    # @param start_date [String] The start date for the data range in YYYY-MM-DD format. The startDate must be
    #  before the endDate, and the date range must not exceed 400 days.
    # @param end_date [String] The end date for the data range in YYYY-MM-DD format. The endDate must be after
    #  the startDate, and the date range must not exceed 400 days.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::Users::UsersMetricEventSummaryResponseItem>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.metric_event_summary(
    #    id: "userId",
    #    key: "words-written",
    #    aggregation: DAILY,
    #    start_date: "2024-01-01",
    #    end_date: "2024-01-31"
    #  )
    def metric_event_summary(id:, key:, aggregation:, start_date:, end_date:, request_options: nil)
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
          "aggregation": aggregation,
          "startDate": start_date,
          "endDate": end_date
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/metrics/#{key}/event-summary"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::Users::UsersMetricEventSummaryResponseItem.from_json(json_object: item)
      end
    end

    # Get a user's achievements.
    #
    # @param id [String] ID of the user.
    # @param include_incomplete [String] When set to 'true', returns both completed and incomplete achievements for the
    #  user. When omitted or set to any other value, returns only completed
    #  achievements.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::CompletedAchievementResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.achievements(id: "userId")
    def achievements(id:, include_incomplete: nil, request_options: nil)
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
          "includeIncomplete": include_incomplete
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/achievements"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::CompletedAchievementResponse.from_json(json_object: item)
      end
    end

    # Get a user's streak data.
    #
    # @param id [String] ID of the user.
    # @param history_periods [Integer] The number of past streak periods to include in the streakHistory field of the
    #  response.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::StreakResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.streak(id: "userId")
    def streak(id:, history_periods: nil, request_options: nil)
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
          "historyPeriods": history_periods
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/streak"
      end
      TrophyApiClient::StreakResponse.from_json(json_object: response.body)
    end

    # Get a user's points for a specific points system.
    #
    # @param id [String] ID of the user.
    # @param key [String] Key of the points system.
    # @param awards [Integer] The number of recent point awards to return.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::GetUserPointsResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.points(id: "userId", key: "points-system-key")
    def points(id:, key:, awards: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "awards": awards }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/points/#{key}"
      end
      TrophyApiClient::GetUserPointsResponse.from_json(json_object: response.body)
    end

    # Get a summary of points awards over time for a user for a specific points
    #  system.
    #
    # @param id [String] ID of the user.
    # @param key [String] Key of the points system.
    # @param aggregation [TrophyApiClient::Users::UsersPointsEventSummaryRequestAggregation] The time period over which to aggregate the event data.
    # @param start_date [String] The start date for the data range in YYYY-MM-DD format. The startDate must be
    #  before the endDate, and the date range must not exceed 400 days.
    # @param end_date [String] The end date for the data range in YYYY-MM-DD format. The endDate must be after
    #  the startDate, and the date range must not exceed 400 days.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::Users::UsersPointsEventSummaryResponseItem>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.points_event_summary(
    #    id: "userId",
    #    key: "points-system-key",
    #    aggregation: DAILY,
    #    start_date: "2024-01-01",
    #    end_date: "2024-01-31"
    #  )
    def points_event_summary(id:, key:, aggregation:, start_date:, end_date:, request_options: nil)
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
          "aggregation": aggregation,
          "startDate": start_date,
          "endDate": end_date
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/points/#{key}/event-summary"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        TrophyApiClient::Users::UsersPointsEventSummaryResponseItem.from_json(json_object: item)
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

    # Create a new user.
    #
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpsertedUser, as a Hash
    #   * :id (String)
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
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

    # Identify a user.
    #
    # @param id [String] ID of the user to identify.
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpdatedUser, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.identify(id: "id", request: { email: "user@example.com", tz: "Europe/London", attributes: { "department": "engineering", "role": "developer" } })
    def identify(id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.put do |req|
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

    # Update a user.
    #
    # @param id [String] ID of the user to update.
    # @param request [Hash] The user object.Request of type TrophyApiClient::UpdatedUser, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :tz (String)
    #   * :device_tokens (Array<String>)
    #   * :subscribe_to_emails (Boolean)
    #   * :attributes (Hash{String => String})
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::User]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.update(id: "id", request: { email: "user@example.com", tz: "Europe/London", attributes: { "department": "engineering", "role": "developer" } })
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
    #  api.users.all_metrics(id: "userId")
    def all_metrics(id:, request_options: nil)
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
    #  api.users.single_metric(id: "userId", key: "key")
    def single_metric(id:, key:, request_options: nil)
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

    # Get a summary of metric events over time for a user.
    #
    # @param id [String] ID of the user.
    # @param key [String] Unique key of the metric.
    # @param aggregation [TrophyApiClient::Users::UsersMetricEventSummaryRequestAggregation] The time period over which to aggregate the event data.
    # @param start_date [String] The start date for the data range in YYYY-MM-DD format. The startDate must be
    #  before the endDate, and the date range must not exceed 400 days.
    # @param end_date [String] The end date for the data range in YYYY-MM-DD format. The endDate must be after
    #  the startDate, and the date range must not exceed 400 days.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::Users::UsersMetricEventSummaryResponseItem>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.metric_event_summary(
    #    id: "userId",
    #    key: "words-written",
    #    aggregation: DAILY,
    #    start_date: "2024-01-01",
    #    end_date: "2024-01-31"
    #  )
    def metric_event_summary(id:, key:, aggregation:, start_date:, end_date:, request_options: nil)
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
            "aggregation": aggregation,
            "startDate": start_date,
            "endDate": end_date
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/metrics/#{key}/event-summary"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::Users::UsersMetricEventSummaryResponseItem.from_json(json_object: item)
        end
      end
    end

    # Get a user's achievements.
    #
    # @param id [String] ID of the user.
    # @param include_incomplete [String] When set to 'true', returns both completed and incomplete achievements for the
    #  user. When omitted or set to any other value, returns only completed
    #  achievements.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::CompletedAchievementResponse>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.achievements(id: "userId")
    def achievements(id:, include_incomplete: nil, request_options: nil)
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
            "includeIncomplete": include_incomplete
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/achievements"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::CompletedAchievementResponse.from_json(json_object: item)
        end
      end
    end

    # Get a user's streak data.
    #
    # @param id [String] ID of the user.
    # @param history_periods [Integer] The number of past streak periods to include in the streakHistory field of the
    #  response.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::StreakResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.streak(id: "userId")
    def streak(id:, history_periods: nil, request_options: nil)
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
            "historyPeriods": history_periods
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/streak"
        end
        TrophyApiClient::StreakResponse.from_json(json_object: response.body)
      end
    end

    # Get a user's points for a specific points system.
    #
    # @param id [String] ID of the user.
    # @param key [String] Key of the points system.
    # @param awards [Integer] The number of recent point awards to return.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [TrophyApiClient::GetUserPointsResponse]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.points(id: "userId", key: "points-system-key")
    def points(id:, key:, awards: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "awards": awards }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/points/#{key}"
        end
        TrophyApiClient::GetUserPointsResponse.from_json(json_object: response.body)
      end
    end

    # Get a summary of points awards over time for a user for a specific points
    #  system.
    #
    # @param id [String] ID of the user.
    # @param key [String] Key of the points system.
    # @param aggregation [TrophyApiClient::Users::UsersPointsEventSummaryRequestAggregation] The time period over which to aggregate the event data.
    # @param start_date [String] The start date for the data range in YYYY-MM-DD format. The startDate must be
    #  before the endDate, and the date range must not exceed 400 days.
    # @param end_date [String] The end date for the data range in YYYY-MM-DD format. The endDate must be after
    #  the startDate, and the date range must not exceed 400 days.
    # @param request_options [TrophyApiClient::RequestOptions]
    # @return [Array<TrophyApiClient::Users::UsersPointsEventSummaryResponseItem>]
    # @example
    #  api = TrophyApiClient::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: TrophyApiClient::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.users.points_event_summary(
    #    id: "userId",
    #    key: "points-system-key",
    #    aggregation: DAILY,
    #    start_date: "2024-01-01",
    #    end_date: "2024-01-31"
    #  )
    def points_event_summary(id:, key:, aggregation:, start_date:, end_date:, request_options: nil)
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
            "aggregation": aggregation,
            "startDate": start_date,
            "endDate": end_date
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/users/#{id}/points/#{key}/event-summary"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::Users::UsersPointsEventSummaryResponseItem.from_json(json_object: item)
        end
      end
    end
  end
end
