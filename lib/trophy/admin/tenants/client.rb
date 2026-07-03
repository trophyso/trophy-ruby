# frozen_string_literal: true

module Trophy
  module Admin
    module Tenants
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

        # List tenants in the current environment.
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
        # @return [Array[Trophy::Types::AdminTenant]]
        def list(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["skip"] = params[:skip] if params.key?(:skip)

          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "GET",
            path: "tenants",
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
            Trophy::Types::ListTenantsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create tenants.
        #
        # @param request_options [Hash]
        # @param params [Trophy::Types::CreateTenantsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Trophy::Types::CreateTenantsResponse]
        def create(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "POST",
            path: "tenants",
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
            Trophy::Types::CreateTenantsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete tenants by ID.
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
        # @return [Trophy::Types::DeleteTenantsResponse]
        def delete(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["ids"] = params[:ids] if params.key?(:ids)

          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "DELETE",
            path: "tenants",
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
            Trophy::Types::DeleteTenantsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update tenants by ID.
        #
        # @param request_options [Hash]
        # @param params [Trophy::Types::UpdateTenantsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Trophy::Types::UpdateTenantsResponse]
        def update(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "PATCH",
            path: "tenants",
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
            Trophy::Types::UpdateTenantsResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Get a tenant by ID.
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
        # @return [Trophy::Types::AdminTenant]
        def get(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "GET",
            path: "tenants/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Trophy::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Trophy::Types::AdminTenant.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
