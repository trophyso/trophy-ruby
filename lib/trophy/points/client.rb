# frozen_string_literal: true

module Trophy
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

      # Get a breakdown of the number of users with points in each range.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :key
      # @option params [String, nil] :user_attributes
      #
      # @return [Array[Trophy::Types::PointsRange]]
      def summary(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["userAttributes"] = params[:user_attributes] if params.key?(:user_attributes)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "points/#{URI.encode_uri_component(params[:key].to_s)}/summary",
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
          Trophy::Types::PointsSummaryResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a points system with its triggers.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :key
      #
      # @return [Trophy::Types::PointsSystemResponse]
      def system(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "points/#{URI.encode_uri_component(params[:key].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::PointsSystemResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get all global boosts for a points system. Finished boosts are excluded by default.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :key
      # @option params [Boolean, nil] :include_finished
      #
      # @return [Array[Trophy::Types::PointsBoost]]
      def boosts(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["includeFinished"] = params[:include_finished] if params.key?(:include_finished)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "points/#{URI.encode_uri_component(params[:key].to_s)}/boosts",
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

      # Get all levels for a points system.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :key
      #
      # @return [Array[Trophy::Types::PointsLevel]]
      def levels(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "points/#{URI.encode_uri_component(params[:key].to_s)}/levels",
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

      # Get a breakdown of the number of users at each level in a points system.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :key
      #
      # @return [Array[Trophy::Types::PointsLevelSummaryResponseItem]]
      def level_summary(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "points/#{URI.encode_uri_component(params[:key].to_s)}/level-summary",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::PointsLevelSummaryResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
