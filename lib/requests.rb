# frozen_string_literal: true

require_relative "environment"
require "faraday"
require "faraday/retry"
require "async/http/faraday"

module TrophyApiClient
  class RequestClient
    # @return [Faraday]
    attr_reader :conn
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String]
    attr_reader :default_environment

    # @param base_url [String]
    # @param environment [TrophyApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param tenant_id [String] The tenant identifier for multi-tenant organisations. Required when the
    #  organisation has multi-tenancy enabled. The value should be your internal ID for
    #  the tenant. Ignored for single-tenant organisations.
    # @return [TrophyApiClient::RequestClient]
    def initialize(api_key:, base_url: nil, environment: TrophyApiClient::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil, tenant_id: nil)
      @default_environment = environment
      @api_key = api_key
      @headers = {}
      @headers["Tenant-ID"] = tenant_id unless tenant_id.nil?
      @conn = Faraday.new(headers: @headers) do |faraday|
        faraday.request :json
        faraday.response :raise_error, include_request: true
        faraday.request :retry, { max: max_retries } unless max_retries.nil?
        faraday.options.timeout = timeout_in_seconds unless timeout_in_seconds.nil?
      end
    end

    # @param request_options [TrophyApiClient::RequestOptions]
    # @param environment [String]
    # @return [String]
    def get_url(environment:, request_options: nil)
      request_options&.base_url || @default_environment[environment] || @base_url
    end

    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": "Ruby", "X-Fern-SDK-Name": "trophy_api_client" }
      headers["X-API-KEY"] = ((@api_key.is_a? Method) ? @api_key.call : @api_key) unless @api_key.nil?
      headers
    end
  end

  class AsyncRequestClient
    # @return [Faraday]
    attr_reader :conn
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String]
    attr_reader :default_environment

    # @param base_url [String]
    # @param environment [TrophyApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param tenant_id [String] The tenant identifier for multi-tenant organisations. Required when the
    #  organisation has multi-tenancy enabled. The value should be your internal ID for
    #  the tenant. Ignored for single-tenant organisations.
    # @return [TrophyApiClient::AsyncRequestClient]
    def initialize(api_key:, base_url: nil, environment: TrophyApiClient::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil, tenant_id: nil)
      @default_environment = environment
      @api_key = api_key
      @headers = {}
      @headers["Tenant-ID"] = tenant_id unless tenant_id.nil?
      @conn = Faraday.new(headers: @headers) do |faraday|
        faraday.request :json
        faraday.response :raise_error, include_request: true
        faraday.adapter :async_http
        faraday.request :retry, { max: max_retries } unless max_retries.nil?
        faraday.options.timeout = timeout_in_seconds unless timeout_in_seconds.nil?
      end
    end

    # @param request_options [TrophyApiClient::RequestOptions]
    # @param environment [String]
    # @return [String]
    def get_url(environment:, request_options: nil)
      request_options&.base_url || @default_environment[environment] || @base_url
    end

    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": "Ruby", "X-Fern-SDK-Name": "trophy_api_client" }
      headers["X-API-KEY"] = ((@api_key.is_a? Method) ? @api_key.call : @api_key) unless @api_key.nil?
      headers
    end
  end

  # Additional options for request-specific configuration when calling APIs via the
  #  SDK.
  class RequestOptions
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String] The tenant identifier for multi-tenant organisations. Required when the
    #  organisation has multi-tenancy enabled. The value should be your internal ID for
    #  the tenant. Ignored for single-tenant organisations.
    attr_reader :tenant_id
    # @return [Hash{String => Object}]
    attr_reader :additional_headers
    # @return [Hash{String => Object}]
    attr_reader :additional_query_parameters
    # @return [Hash{String => Object}]
    attr_reader :additional_body_parameters
    # @return [Long]
    attr_reader :timeout_in_seconds

    # @param base_url [String]
    # @param api_key [String]
    # @param tenant_id [String] The tenant identifier for multi-tenant organisations. Required when the
    #  organisation has multi-tenancy enabled. The value should be your internal ID for
    #  the tenant. Ignored for single-tenant organisations.
    # @param additional_headers [Hash{String => Object}]
    # @param additional_query_parameters [Hash{String => Object}]
    # @param additional_body_parameters [Hash{String => Object}]
    # @param timeout_in_seconds [Long]
    # @return [TrophyApiClient::RequestOptions]
    def initialize(base_url: nil, api_key: nil, tenant_id: nil, additional_headers: nil,
                   additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @api_key = api_key
      @tenant_id = tenant_id
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end

  # Additional options for request-specific configuration when calling APIs via the
  #  SDK.
  class IdempotencyRequestOptions
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String] The tenant identifier for multi-tenant organisations. Required when the
    #  organisation has multi-tenancy enabled. The value should be your internal ID for
    #  the tenant. Ignored for single-tenant organisations.
    attr_reader :tenant_id
    # @return [Hash{String => Object}]
    attr_reader :additional_headers
    # @return [Hash{String => Object}]
    attr_reader :additional_query_parameters
    # @return [Hash{String => Object}]
    attr_reader :additional_body_parameters
    # @return [Long]
    attr_reader :timeout_in_seconds

    # @param base_url [String]
    # @param api_key [String]
    # @param tenant_id [String] The tenant identifier for multi-tenant organisations. Required when the
    #  organisation has multi-tenancy enabled. The value should be your internal ID for
    #  the tenant. Ignored for single-tenant organisations.
    # @param additional_headers [Hash{String => Object}]
    # @param additional_query_parameters [Hash{String => Object}]
    # @param additional_body_parameters [Hash{String => Object}]
    # @param timeout_in_seconds [Long]
    # @return [TrophyApiClient::IdempotencyRequestOptions]
    def initialize(base_url: nil, api_key: nil, tenant_id: nil, additional_headers: nil,
                   additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @api_key = api_key
      @tenant_id = tenant_id
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end
end
