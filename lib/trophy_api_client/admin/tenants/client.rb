# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/list_tenants_response"
require "json"
require_relative "../../types/create_tenants_request"
require_relative "../../types/create_tenants_response"
require_relative "../../types/delete_tenants_response"
require_relative "../../types/update_tenants_request"
require_relative "../../types/update_tenants_response"
require_relative "../../types/admin_tenant"
require "async"

module TrophyApiClient
  module Admin
    class TenantsClient
      # @return [TrophyApiClient::RequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::TenantsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List tenants in the current environment.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_TENANTS_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.list(limit: 1, skip: 1)
      def list(limit: nil, skip: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "skip": skip }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::AdminTenant.from_json(json_object: item)
        end
      end

      # Create tenants.
      #
      # @param request [TrophyApiClient::CREATE_TENANTS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateTenantsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.create(request: [{ customer_id: "customer_12345", name: "Acme Corp" }, { customer_id: "customer_67890", name: "Globex Inc" }])
      def create(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
        end
        TrophyApiClient::CreateTenantsResponse.from_json(json_object: response.body)
      end

      # Delete tenants by ID.
      #
      # @param ids [String] Tenant IDs to delete. Repeat the query param or provide a comma-separated list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteTenantsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.delete
      def delete(ids: nil, request_options: nil)
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "ids": ids }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
        end
        TrophyApiClient::DeleteTenantsResponse.from_json(json_object: response.body)
      end

      # Update tenants by ID.
      #
      # @param request [TrophyApiClient::UPDATE_TENANTS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateTenantsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Acme Corporation" }])
      def update(request:, request_options: nil)
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
        end
        TrophyApiClient::UpdateTenantsResponse.from_json(json_object: response.body)
      end

      # Get a tenant by ID.
      #
      # @param id [String] The UUID of the tenant to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::AdminTenant]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.get(id: "550e8400-e29b-41d4-a716-446655440000")
      def get(id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants/#{id}"
        end
        TrophyApiClient::AdminTenant.from_json(json_object: response.body)
      end
    end

    class AsyncTenantsClient
      # @return [TrophyApiClient::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncTenantsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List tenants in the current environment.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_TENANTS_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.list(limit: 1, skip: 1)
      def list(limit: nil, skip: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::AdminTenant.from_json(json_object: item)
          end
        end
      end

      # Create tenants.
      #
      # @param request [TrophyApiClient::CREATE_TENANTS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateTenantsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.create(request: [{ customer_id: "customer_12345", name: "Acme Corp" }, { customer_id: "customer_67890", name: "Globex Inc" }])
      def create(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
          end
          TrophyApiClient::CreateTenantsResponse.from_json(json_object: response.body)
        end
      end

      # Delete tenants by ID.
      #
      # @param ids [String] Tenant IDs to delete. Repeat the query param or provide a comma-separated list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteTenantsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.delete
      def delete(ids: nil, request_options: nil)
        Async do
          response = @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "ids": ids }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
          end
          TrophyApiClient::DeleteTenantsResponse.from_json(json_object: response.body)
        end
      end

      # Update tenants by ID.
      #
      # @param request [TrophyApiClient::UPDATE_TENANTS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateTenantsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Acme Corporation" }])
      def update(request:, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants"
          end
          TrophyApiClient::UpdateTenantsResponse.from_json(json_object: response.body)
        end
      end

      # Get a tenant by ID.
      #
      # @param id [String] The UUID of the tenant to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::AdminTenant]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.tenants.get(id: "550e8400-e29b-41d4-a716-446655440000")
      def get(id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["X-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["Tenant-ID"] = request_options.tenant_id unless request_options&.tenant_id.nil?
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/tenants/#{id}"
          end
          TrophyApiClient::AdminTenant.from_json(json_object: response.body)
        end
      end
    end
  end
end
