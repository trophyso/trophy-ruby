# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/list_attributes_response"
require "json"
require_relative "../../types/create_attributes_request"
require_relative "../../types/create_attributes_response"
require_relative "../../types/delete_attributes_response"
require_relative "../../types/update_attributes_request"
require_relative "../../types/update_attributes_response"
require_relative "../../types/admin_attribute"
require "async"

module TrophyApiClient
  module Admin
    class AttributesClient
      # @return [TrophyApiClient::RequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::AttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List attributes.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_ATTRIBUTES_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.list(limit: 1, skip: 1)
      def list(limit: nil, skip: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "skip": skip }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::AdminAttribute.from_json(json_object: item)
        end
      end

      # Create attributes in bulk.
      #
      # @param request [TrophyApiClient::CREATE_ATTRIBUTES_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateAttributesResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.create(request: [{ name: "Plan", key: "plan", type: USER }, { name: "Device", key: "device", type: EVENT }])
      def create(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
        end
        TrophyApiClient::CreateAttributesResponse.from_json(json_object: response.body)
      end

      # Delete attributes in bulk by ID.
      #
      # @param ids [String] Attribute IDs to delete. Repeat the query param or provide a comma-separated
      #  list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteAttributesResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.delete
      def delete(ids: nil, request_options: nil)
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "ids": ids }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
        end
        TrophyApiClient::DeleteAttributesResponse.from_json(json_object: response.body)
      end

      # Update attributes in bulk by ID.
      #
      # @param request [TrophyApiClient::UPDATE_ATTRIBUTES_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateAttributesResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Subscription Plan" }])
      def update(request:, request_options: nil)
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
        end
        TrophyApiClient::UpdateAttributesResponse.from_json(json_object: response.body)
      end

      # Get an attribute by ID.
      #
      # @param id [String] The UUID of the attribute to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::AdminAttribute]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.get(id: "550e8400-e29b-41d4-a716-446655440000")
      def get(id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes/#{id}"
        end
        TrophyApiClient::AdminAttribute.from_json(json_object: response.body)
      end
    end

    class AsyncAttributesClient
      # @return [TrophyApiClient::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncAttributesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List attributes.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_ATTRIBUTES_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.list(limit: 1, skip: 1)
      def list(limit: nil, skip: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "skip": skip
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::AdminAttribute.from_json(json_object: item)
          end
        end
      end

      # Create attributes in bulk.
      #
      # @param request [TrophyApiClient::CREATE_ATTRIBUTES_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateAttributesResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.create(request: [{ name: "Plan", key: "plan", type: USER }, { name: "Device", key: "device", type: EVENT }])
      def create(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
          end
          TrophyApiClient::CreateAttributesResponse.from_json(json_object: response.body)
        end
      end

      # Delete attributes in bulk by ID.
      #
      # @param ids [String] Attribute IDs to delete. Repeat the query param or provide a comma-separated
      #  list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteAttributesResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.delete
      def delete(ids: nil, request_options: nil)
        Async do
          response = @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "ids": ids }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
          end
          TrophyApiClient::DeleteAttributesResponse.from_json(json_object: response.body)
        end
      end

      # Update attributes in bulk by ID.
      #
      # @param request [TrophyApiClient::UPDATE_ATTRIBUTES_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateAttributesResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Subscription Plan" }])
      def update(request:, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes"
          end
          TrophyApiClient::UpdateAttributesResponse.from_json(json_object: response.body)
        end
      end

      # Get an attribute by ID.
      #
      # @param id [String] The UUID of the attribute to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::AdminAttribute]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.attributes.get(id: "550e8400-e29b-41d4-a716-446655440000")
      def get(id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/attributes/#{id}"
          end
          TrophyApiClient::AdminAttribute.from_json(json_object: response.body)
        end
      end
    end
  end
end
