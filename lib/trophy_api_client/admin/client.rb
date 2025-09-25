# frozen_string_literal: true

require_relative "../../requests"
require_relative "streaks/client"

module TrophyApiClient
  module Admin
    class Client
      # @return [TrophyApiClient::Admin::Streaks::Client]
      attr_reader :admin

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::Client]
      def initialize(request_client:)
        @admin = TrophyApiClient::Admin::Streaks::Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [TrophyApiClient::Admin::Streaks::AsyncClient]
      attr_reader :admin

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncClient]
      def initialize(request_client:)
        @admin = TrophyApiClient::Admin::Streaks::AsyncClient.new(request_client: request_client)
      end
    end
  end
end
