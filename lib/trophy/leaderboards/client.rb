# frozen_string_literal: true

module Trophy
  module Leaderboards
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

      # Get all leaderboards for your organization. Finished leaderboards are excluded by default.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Boolean, nil] :include_finished
      #
      # @return [Array[Trophy::Leaderboards::Types::LeaderboardsAllResponseItem]]
      def all(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["includeFinished"] = params[:include_finished] if params.key?(:include_finished)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "leaderboards",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Get a specific leaderboard by its key.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :key
      # @option params [Integer, nil] :offset
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :run
      # @option params [String, nil] :user_id
      # @option params [String, nil] :user_attributes
      #
      # @return [Trophy::Types::LeaderboardResponseWithRankings]
      def get(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["run"] = params[:run] if params.key?(:run)
        query_params["userId"] = params[:user_id] if params.key?(:user_id)
        query_params["userAttributes"] = params[:user_attributes] if params.key?(:user_attributes)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "leaderboards/#{URI.encode_uri_component(params[:key].to_s)}",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::LeaderboardResponseWithRankings.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
