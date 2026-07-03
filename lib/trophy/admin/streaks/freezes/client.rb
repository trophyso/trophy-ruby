# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Freezes
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

          # Create streak freezes for multiple users.
          #
          # @param request_options [Hash]
          # @param params [Trophy::Admin::Streaks::Freezes::Types::CreateStreakFreezesRequest]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Trophy::Types::CreateStreakFreezesResponse]
          def create(request_options: {}, **params)
            params = Trophy::Internal::Types::Utils.normalize_keys(params)
            request = Trophy::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
              method: "POST",
              path: "streaks/freezes",
              body: Trophy::Admin::Streaks::Freezes::Types::CreateStreakFreezesRequest.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Trophy::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Trophy::Types::CreateStreakFreezesResponse.load(response.body)
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
