# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "trophy_api_client/achievements/client"
require_relative "trophy_api_client/metrics/client"
require_relative "trophy_api_client/users/client"

module TrophyApiClient
  class Client
    # @return [TrophyApiClient::AchievementsClient]
    attr_reader :achievements
    # @return [TrophyApiClient::MetricsClient]
    attr_reader :metrics
    # @return [TrophyApiClient::UsersClient]
    attr_reader :users

    # @param base_url [String]
    # @param environment [TrophyApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [TrophyApiClient::Client]
    def initialize(api_key:, base_url: nil, environment: TrophyApiClient::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = TrophyApiClient::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @achievements = TrophyApiClient::AchievementsClient.new(request_client: @request_client)
      @metrics = TrophyApiClient::MetricsClient.new(request_client: @request_client)
      @users = TrophyApiClient::UsersClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [TrophyApiClient::AsyncAchievementsClient]
    attr_reader :achievements
    # @return [TrophyApiClient::AsyncMetricsClient]
    attr_reader :metrics
    # @return [TrophyApiClient::AsyncUsersClient]
    attr_reader :users

    # @param base_url [String]
    # @param environment [TrophyApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [TrophyApiClient::AsyncClient]
    def initialize(api_key:, base_url: nil, environment: TrophyApiClient::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = TrophyApiClient::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @achievements = TrophyApiClient::AsyncAchievementsClient.new(request_client: @async_request_client)
      @metrics = TrophyApiClient::AsyncMetricsClient.new(request_client: @async_request_client)
      @users = TrophyApiClient::AsyncUsersClient.new(request_client: @async_request_client)
    end
  end
end
