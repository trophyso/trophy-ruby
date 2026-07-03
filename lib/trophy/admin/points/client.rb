# frozen_string_literal: true

module Trophy
  module Admin
    module Points
      class Client
        # @param client [Trophy::Internal::Http::RawClient]
        # @param base_url [String, nil]
        # @param environment [Hash[Symbol, String], nil]
        #
        # @return [void]
        def initialize(client:, base_url: nil, environment: nil)
          @client = client
          @base_url = base_url
          @environment = environment
        end

        # @return [Trophy::Systems::Client]
        def systems
          @systems ||= Trophy::Admin::Points::Systems::Client.new(client: @client, base_url: @base_url, environment: @environment)
        end

        # @return [Trophy::Boosts::Client]
        def boosts
          @boosts ||= Trophy::Admin::Points::Boosts::Client.new(client: @client, base_url: @base_url, environment: @environment)
        end

        # @return [Trophy::Levels::Client]
        def levels
          @levels ||= Trophy::Admin::Points::Levels::Client.new(client: @client, base_url: @base_url, environment: @environment)
        end

        # @return [Trophy::Triggers::Client]
        def triggers
          @triggers ||= Trophy::Admin::Points::Triggers::Client.new(client: @client, base_url: @base_url, environment: @environment)
        end
      end
    end
  end
end
