# frozen_string_literal: true

module Trophy
  module Streaks
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

      # Get the streak lengths of a list of users, ranked by streak length from longest to shortest.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :user_ids
      #
      # @return [Array[Trophy::Types::BulkStreakResponseItem]]
      def list(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["userIds"] = params[:user_ids] if params.key?(:user_ids)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "streaks",
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
          Trophy::Types::BulkStreakResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
