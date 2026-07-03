# frozen_string_literal: true

module Trophy
  module Admin
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

      # @return [Trophy::Attributes::Client]
      def attributes
        @attributes ||= Trophy::Admin::Attributes::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Trophy::Metrics::Client]
      def metrics
        @metrics ||= Trophy::Admin::Metrics::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Trophy::Leaderboards::Client]
      def leaderboards
        @leaderboards ||= Trophy::Admin::Leaderboards::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Trophy::Streaks::Client]
      def streaks
        @streaks ||= Trophy::Admin::Streaks::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Trophy::Tenants::Client]
      def tenants
        @tenants ||= Trophy::Admin::Tenants::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Trophy::Points::Client]
      def points
        @points ||= Trophy::Admin::Points::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
