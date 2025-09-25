# frozen_string_literal: true

require_relative "../../../requests"
require_relative "freezes/client"

module TrophyApiClient
  module Admin
    module Streaks
      class Client
        # @return [TrophyApiClient::Admin::Streaks::FreezesClient]
        attr_reader :freezes

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Streaks::Client]
        def initialize(request_client:)
          @freezes = TrophyApiClient::Admin::Streaks::FreezesClient.new(request_client: request_client)
        end
      end

      class AsyncClient
        # @return [TrophyApiClient::Admin::Streaks::AsyncFreezesClient]
        attr_reader :freezes

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Streaks::AsyncClient]
        def initialize(request_client:)
          @freezes = TrophyApiClient::Admin::Streaks::AsyncFreezesClient.new(request_client: request_client)
        end
      end
    end
  end
end
