# frozen_string_literal: true

module Trophy
  module Achievements
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

      # Get all achievements and their completion stats.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :user_attributes
      #
      # @return [Array[Trophy::Types::AchievementWithStatsResponse]]
      def all(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["userAttributes"] = params[:user_attributes] if params.key?(:user_attributes)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "achievements",
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

      # Mark an achievement as completed for a user.
      #
      # @param request_options [Hash]
      # @param params [Trophy::Achievements::Types::AchievementsCompleteRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :key
      #
      # @return [Trophy::Types::AchievementCompletionResponse]
      def complete(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request_data = Trophy::Achievements::Types::AchievementsCompleteRequest.new(params).to_h
        non_body_param_names = %w[key]
        body = request_data.except(*non_body_param_names)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "POST",
          path: "achievements/#{URI.encode_uri_component(params[:key].to_s)}/complete",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::AchievementCompletionResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
