# frozen_string_literal: true

require_relative "../../requests"
require_relative "attributes/client"
require_relative "metrics/client"
require_relative "leaderboards/client"
require_relative "streaks/client"
require_relative "points/client"

module TrophyApiClient
  module Admin
    class Client
      # @return [TrophyApiClient::Admin::AttributesClient]
      attr_reader :attributes
      # @return [TrophyApiClient::Admin::MetricsClient]
      attr_reader :metrics
      # @return [TrophyApiClient::Admin::LeaderboardsClient]
      attr_reader :leaderboards
      # @return [TrophyApiClient::Admin::StreaksClient]
      attr_reader :streaks
      # @return [TrophyApiClient::Admin::Points::Client]
      attr_reader :admin

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::Client]
      def initialize(request_client:)
        @attributes = TrophyApiClient::Admin::AttributesClient.new(request_client: request_client)
        @metrics = TrophyApiClient::Admin::MetricsClient.new(request_client: request_client)
        @leaderboards = TrophyApiClient::Admin::LeaderboardsClient.new(request_client: request_client)
        @streaks = TrophyApiClient::Admin::StreaksClient.new(request_client: request_client)
        @admin = TrophyApiClient::Admin::Points::Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [TrophyApiClient::Admin::AsyncAttributesClient]
      attr_reader :attributes
      # @return [TrophyApiClient::Admin::AsyncMetricsClient]
      attr_reader :metrics
      # @return [TrophyApiClient::Admin::AsyncLeaderboardsClient]
      attr_reader :leaderboards
      # @return [TrophyApiClient::Admin::AsyncStreaksClient]
      attr_reader :streaks
      # @return [TrophyApiClient::Admin::Points::AsyncClient]
      attr_reader :admin

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncClient]
      def initialize(request_client:)
        @attributes = TrophyApiClient::Admin::AsyncAttributesClient.new(request_client: request_client)
        @metrics = TrophyApiClient::Admin::AsyncMetricsClient.new(request_client: request_client)
        @leaderboards = TrophyApiClient::Admin::AsyncLeaderboardsClient.new(request_client: request_client)
        @streaks = TrophyApiClient::Admin::AsyncStreaksClient.new(request_client: request_client)
        @admin = TrophyApiClient::Admin::Points::AsyncClient.new(request_client: request_client)
      end
    end
  end
end
