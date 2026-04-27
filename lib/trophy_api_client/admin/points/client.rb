# frozen_string_literal: true

require_relative "../../../requests"
require_relative "systems/client"
require_relative "boosts/client"
require_relative "levels/client"
require_relative "triggers/client"

module TrophyApiClient
  module Admin
    module Points
      class Client
        # @return [TrophyApiClient::Admin::Points::SystemsClient]
        attr_reader :systems
        # @return [TrophyApiClient::Admin::Points::BoostsClient]
        attr_reader :boosts
        # @return [TrophyApiClient::Admin::Points::LevelsClient]
        attr_reader :levels
        # @return [TrophyApiClient::Admin::Points::TriggersClient]
        attr_reader :triggers

        # @param request_client [TrophyApiClient::RequestClient]
        # @return [TrophyApiClient::Admin::Points::Client]
        def initialize(request_client:)
          @systems = TrophyApiClient::Admin::Points::SystemsClient.new(request_client: request_client)
          @boosts = TrophyApiClient::Admin::Points::BoostsClient.new(request_client: request_client)
          @levels = TrophyApiClient::Admin::Points::LevelsClient.new(request_client: request_client)
          @triggers = TrophyApiClient::Admin::Points::TriggersClient.new(request_client: request_client)
        end
      end

      class AsyncClient
        # @return [TrophyApiClient::Admin::Points::AsyncSystemsClient]
        attr_reader :systems
        # @return [TrophyApiClient::Admin::Points::AsyncBoostsClient]
        attr_reader :boosts
        # @return [TrophyApiClient::Admin::Points::AsyncLevelsClient]
        attr_reader :levels
        # @return [TrophyApiClient::Admin::Points::AsyncTriggersClient]
        attr_reader :triggers

        # @param request_client [TrophyApiClient::AsyncRequestClient]
        # @return [TrophyApiClient::Admin::Points::AsyncClient]
        def initialize(request_client:)
          @systems = TrophyApiClient::Admin::Points::AsyncSystemsClient.new(request_client: request_client)
          @boosts = TrophyApiClient::Admin::Points::AsyncBoostsClient.new(request_client: request_client)
          @levels = TrophyApiClient::Admin::Points::AsyncLevelsClient.new(request_client: request_client)
          @triggers = TrophyApiClient::Admin::Points::AsyncTriggersClient.new(request_client: request_client)
        end
      end
    end
  end
end
