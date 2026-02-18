# frozen_string_literal: true

require_relative "../../requests"
require_relative "streaks/client"
require_relative "points/client"

module TrophyApiClient
  module Admin
    class Client
      # @return [TrophyApiClient::Admin::StreaksClient]
      attr_reader :streaks
      # @return [TrophyApiClient::Admin::Points::Client]
      attr_reader :admin

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::Client]
      def initialize(request_client:)
        @streaks = TrophyApiClient::Admin::StreaksClient.new(request_client: request_client)
        @admin = TrophyApiClient::Admin::Points::Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [TrophyApiClient::Admin::AsyncStreaksClient]
      attr_reader :streaks
      # @return [TrophyApiClient::Admin::Points::AsyncClient]
      attr_reader :admin

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncClient]
      def initialize(request_client:)
        @streaks = TrophyApiClient::Admin::AsyncStreaksClient.new(request_client: request_client)
        @admin = TrophyApiClient::Admin::Points::AsyncClient.new(request_client: request_client)
      end
    end
  end
end
