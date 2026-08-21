# frozen_string_literal: true

module Trophy
  class Client
    # @param api_key [String]
    # @param base_url [String, nil]
    # @param environment [Hash[Symbol, String], nil]
    # @param sdk_version [String, nil]
    # @param max_retries [Integer]
    #
    # @return [void]
    def initialize(api_key:, base_url: nil, environment: Trophy::Environment::PRODUCTION, sdk_version: "1.21.0", max_retries: 2)
      @base_url = base_url
      @environment = environment

      @raw_client = Trophy::Internal::Http::RawClient.new(
        base_url: base_url || environment&.dig(:api),
        headers: {
          "X-Fern-Language" => "Ruby",
          "X-API-KEY" => api_key.to_s,
          "X-SDK-VERSION" => sdk_version.to_s
        },
        max_retries: max_retries
      )
    end

    # @return [Trophy::Achievements::Client]
    def achievements
      @achievements ||= Trophy::Achievements::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Trophy::Metrics::Client]
    def metrics
      @metrics ||= Trophy::Metrics::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Trophy::Users::Client]
    def users
      @users ||= Trophy::Users::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Trophy::Streaks::Client]
    def streaks
      @streaks ||= Trophy::Streaks::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Trophy::Points::Client]
    def points
      @points ||= Trophy::Points::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Trophy::Leaderboards::Client]
    def leaderboards
      @leaderboards ||= Trophy::Leaderboards::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Trophy::Admin::Client]
    def admin
      @admin ||= Trophy::Admin::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end
  end
end
