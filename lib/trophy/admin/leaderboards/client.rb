# frozen_string_literal: true

module Trophy
  module Admin
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

        # List leaderboards.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [Integer, nil] :skip
        #
        # @return [Array[Trophy::Types::AdminLeaderboard]]
        def list(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["skip"] = params[:skip] if params.key?(:skip)

          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
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
          if code.between?(200, 299)
            Trophy::Types::ListLeaderboardsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create leaderboards. Maximum 100 leaderboards per request.
        #
        # @param request_options [Hash]
        # @param params [Trophy::Types::CreateLeaderboardsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Trophy::Types::CreateLeaderboardsResponse]
        def create(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "POST",
            path: "leaderboards",
            body: params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Trophy::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Trophy::Types::CreateLeaderboardsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete leaderboards by ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :ids
        #
        # @return [Trophy::Types::DeleteLeaderboardsResponse]
        def delete(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["ids"] = params[:ids] if params.key?(:ids)

          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "DELETE",
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
          if code.between?(200, 299)
            Trophy::Types::DeleteLeaderboardsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update leaderboards by ID. Updating `status` behaves the same as activating, scheduling, deactivating, or
        # finishing a leaderboard in the dashboard.
        #
        # @param request_options [Hash]
        # @param params [Trophy::Types::UpdateLeaderboardsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Trophy::Types::UpdateLeaderboardsResponse]
        def update(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "PATCH",
            path: "leaderboards",
            body: params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Trophy::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Trophy::Types::UpdateLeaderboardsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Get a leaderboard by ID.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Trophy::Types::AdminLeaderboard]
        def get(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "GET",
            path: "leaderboards/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Trophy::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Trophy::Types::AdminLeaderboard.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
