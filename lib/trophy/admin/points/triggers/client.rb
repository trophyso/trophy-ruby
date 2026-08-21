# frozen_string_literal: true

module Trophy
  module Admin
    module Points
      module Triggers
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

          # List points triggers for a system.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :system_id
          # @option params [Integer, nil] :limit
          # @option params [Integer, nil] :skip
          #
          # @return [Array[Trophy::Types::AdminPointsTrigger]]
          def list(request_options: {}, **params)
            params = Trophy::Internal::Types::Utils.normalize_keys(params)
            query_params = {}
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["skip"] = params[:skip] if params.key?(:skip)

            request = Trophy::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
              method: "GET",
              path: "points/#{URI.encode_uri_component(params[:system_id].to_s)}/triggers",
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
              Trophy::Types::ListPointsTriggersResponse.load(response.body)
            else
              error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Create points triggers in bulk. Maximum 100 triggers per request.
          #
          # @param request_options [Hash]
          # @param params [Trophy::Types::CreatePointsTriggersRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :system_id
          #
          # @return [Trophy::Types::CreatePointsTriggersResponse]
          def create(request_options: {}, **params)
            params = Trophy::Internal::Types::Utils.normalize_keys(params)
            request = Trophy::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
              method: "POST",
              path: "points/#{URI.encode_uri_component(params[:system_id].to_s)}/triggers",
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
              Trophy::Types::CreatePointsTriggersResponse.load(response.body)
            else
              error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Delete points triggers by ID. Maximum 100 trigger IDs per request.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :system_id
          # @option params [String, nil] :ids
          #
          # @return [Trophy::Types::DeletePointsTriggersResponse]
          def delete(request_options: {}, **params)
            params = Trophy::Internal::Types::Utils.normalize_keys(params)
            query_params = {}
            query_params["ids"] = params[:ids] if params.key?(:ids)

            request = Trophy::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
              method: "DELETE",
              path: "points/#{URI.encode_uri_component(params[:system_id].to_s)}/triggers",
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
              Trophy::Types::DeletePointsTriggersResponse.load(response.body)
            else
              error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Update points triggers in bulk. Maximum 100 triggers per request. Only provided fields are updated; omitted
          # fields are preserved.
          #
          # @param request_options [Hash]
          # @param params [Trophy::Types::PatchPointsTriggersRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :system_id
          #
          # @return [Trophy::Types::PatchPointsTriggersResponse]
          def update(request_options: {}, **params)
            params = Trophy::Internal::Types::Utils.normalize_keys(params)
            request = Trophy::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
              method: "PATCH",
              path: "points/#{URI.encode_uri_component(params[:system_id].to_s)}/triggers",
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
              Trophy::Types::PatchPointsTriggersResponse.load(response.body)
            else
              error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Get a single points trigger by ID.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :system_id
          # @option params [String] :id
          #
          # @return [Trophy::Types::AdminPointsTrigger]
          def get(request_options: {}, **params)
            params = Trophy::Internal::Types::Utils.normalize_keys(params)
            request = Trophy::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
              method: "GET",
              path: "points/#{URI.encode_uri_component(params[:system_id].to_s)}/triggers/#{URI.encode_uri_component(params[:id].to_s)}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Trophy::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Trophy::Types::AdminPointsTrigger.load(response.body)
            else
              error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
