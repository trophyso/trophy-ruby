# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
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

        # Restore streaks for multiple users to the maximum previously achieved streak length found within the current
        # restore window: the last 90 days for daily streaks, weekly periods starting with the week containing the start
        # of the current calendar year for weekly streaks, and monthly periods starting at the beginning of the previous
        # calendar year for monthly streaks.
        #
        # @param request_options [Hash]
        # @param params [Trophy::Admin::Streaks::Types::RestoreStreaksRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Trophy::Types::RestoreStreaksResponse]
        def restore(request_options: {}, **params)
          params = Trophy::Internal::Types::Utils.normalize_keys(params)
          request = Trophy::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:admin),
            method: "POST",
            path: "streaks/restore",
            body: Trophy::Admin::Streaks::Types::RestoreStreaksRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Trophy::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Trophy::Types::RestoreStreaksResponse.load(response.body)
          else
            error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @return [Trophy::Freezes::Client]
        def freezes
          @freezes ||= Trophy::Admin::Streaks::Freezes::Client.new(client: @client, base_url: @base_url, environment: @environment)
        end

        # @return [Trophy::Pauses::Client]
        def pauses
          @pauses ||= Trophy::Admin::Streaks::Pauses::Client.new(client: @client, base_url: @base_url, environment: @environment)
        end
      end
    end
  end
end
