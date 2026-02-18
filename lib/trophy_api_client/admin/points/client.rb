# frozen_string_literal: true

require_relative "../../../requests"
require_relative "boosts/client"

module TrophyApiClient
  module Admin
    module Points
      class Client
        # @return [TrophyApiClient::Admin::Points::BoostsClient]
        attr_reader :boosts

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Points::Client]
        def initialize(request_client:)
          @boosts = TrophyApiClient::Admin::Points::BoostsClient.new(request_client: request_client)
        end
      end

      class AsyncClient
        # @return [TrophyApiClient::Admin::Points::AsyncBoostsClient]
        attr_reader :boosts

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Points::AsyncClient]
        def initialize(request_client:)
          @boosts = TrophyApiClient::Admin::Points::AsyncBoostsClient.new(request_client: request_client)
        end
      end
    end
  end
end
