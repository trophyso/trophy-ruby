# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/list_metrics_response"
require "json"
require_relative "../../types/create_metrics_request"
require_relative "../../types/create_metrics_response"
require_relative "../../types/delete_metrics_response"
require_relative "../../types/update_metrics_request"
require_relative "../../types/update_metrics_response"
require_relative "../../types/created_metric"
require "async"

module TrophyApiClient
  module Admin
    class MetricsClient
      # @return [TrophyApiClient::RequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::RequestClient]
      # @return [TrophyApiClient::Admin::MetricsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List metrics.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_METRICS_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.list(limit: 1, skip: 1)
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          TrophyApiClient::CreatedMetric.from_json(json_object: item)
        end
      end

      # Create metrics.
      #
      # @param request [TrophyApiClient::CREATE_METRICS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateMetricsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.create(request: [{ name: "Invites Sent", key: "invites-sent" }, { name: "Revenue", key: "revenue", unit_type: CURRENCY, units: "USD" }])
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
        end
        TrophyApiClient::CreateMetricsResponse.from_json(json_object: response.body)
      end

      # Delete metrics by ID.
      #
      # @param ids [String] Metric IDs to delete. Repeat the query param or provide a comma-separated list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteMetricsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.delete
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
        end
        TrophyApiClient::DeleteMetricsResponse.from_json(json_object: response.body)
      end

      # Update metrics by ID.
      #
      # @param request [TrophyApiClient::UPDATE_METRICS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateMetricsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Invites Completed", units: "invites" }, { id: "550e8400-e29b-41d4-a716-446655440001", unit_type: NUMBER, units: "dollars" }])
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
        end
        TrophyApiClient::UpdateMetricsResponse.from_json(json_object: response.body)
      end

      # Get a metric by ID.
      #
      # @param id [String] The UUID of the metric to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreatedMetric]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.get(id: "550e8400-e29b-41d4-a716-446655440000")
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
          req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics/#{id}"
        end
        TrophyApiClient::CreatedMetric.from_json(json_object: response.body)
      end
    end

    class AsyncMetricsClient
      # @return [TrophyApiClient::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [TrophyApiClient::AsyncRequestClient]
      # @return [TrophyApiClient::Admin::AsyncMetricsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # List metrics.
      #
      # @param limit [Integer] Number of records to return.
      # @param skip [Integer] Number of records to skip from the start of the list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::LIST_METRICS_RESPONSE]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.list(limit: 1, skip: 1)
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            TrophyApiClient::CreatedMetric.from_json(json_object: item)
          end
        end
      end

      # Create metrics.
      #
      # @param request [TrophyApiClient::CREATE_METRICS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreateMetricsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.create(request: [{ name: "Invites Sent", key: "invites-sent" }, { name: "Revenue", key: "revenue", unit_type: CURRENCY, units: "USD" }])
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
          end
          TrophyApiClient::CreateMetricsResponse.from_json(json_object: response.body)
        end
      end

      # Delete metrics by ID.
      #
      # @param ids [String] Metric IDs to delete. Repeat the query param or provide a comma-separated list.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::DeleteMetricsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.delete
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
          end
          TrophyApiClient::DeleteMetricsResponse.from_json(json_object: response.body)
        end
      end

      # Update metrics by ID.
      #
      # @param request [TrophyApiClient::UPDATE_METRICS_REQUEST]
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::UpdateMetricsResponse]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.update(request: [{ id: "550e8400-e29b-41d4-a716-446655440000", name: "Invites Completed", units: "invites" }, { id: "550e8400-e29b-41d4-a716-446655440001", unit_type: NUMBER, units: "dollars" }])
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics"
          end
          TrophyApiClient::UpdateMetricsResponse.from_json(json_object: response.body)
        end
      end

      # Get a metric by ID.
      #
      # @param id [String] The UUID of the metric to retrieve.
      # @param request_options [TrophyApiClient::RequestOptions]
      # @return [TrophyApiClient::CreatedMetric]
      # @example
      #  api = TrophyApiClient::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: TrophyApiClient::Environment::PRODUCTION,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.admin.metrics.get(id: "550e8400-e29b-41d4-a716-446655440000")
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
            req.url "#{@request_client.get_url(environment: admin, request_options: request_options)}/metrics/#{id}"
          end
          TrophyApiClient::CreatedMetric.from_json(json_object: response.body)
        end
      end
    end
  end
end
