# frozen_string_literal: true

module Trophy
  module Admin
    module Metrics
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

        # List metrics.
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
        # @return [Array[Trophy::Types::CreatedMetric]]
        def list(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["skip"] = params[:skip] if params.key?(:skip)

          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "GET",
            path: "metrics",
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
            Trophy::Types::ListMetricsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create metrics.
        #
        # @param request_options [Hash]
        # @param params [Trophy::Types::CreateMetricsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Trophy::Types::CreateMetricsResponse]
        def create(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "POST",
            path: "metrics",
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
            Trophy::Types::CreateMetricsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete metrics by ID.
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
        # @return [Trophy::Types::DeleteMetricsResponse]
        def delete(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["ids"] = params[:ids] if params.key?(:ids)

          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "DELETE",
            path: "metrics",
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
            Trophy::Types::DeleteMetricsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update metrics by ID.
        #
        # @param request_options [Hash]
        # @param params [Trophy::Types::UpdateMetricsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Trophy::Types::UpdateMetricsResponse]
        def update(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "PATCH",
            path: "metrics",
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
            Trophy::Types::UpdateMetricsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Get a metric by ID.
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
        # @return [Trophy::Types::CreatedMetric]
        def get(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "GET",
            path: "metrics/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Trophy::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Trophy::Types::CreatedMetric.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
