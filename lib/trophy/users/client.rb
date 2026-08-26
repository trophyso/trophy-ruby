# frozen_string_literal: true

module Trophy
  module Users
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

      # Create a new user.
      #
      # @param request_options [Hash]
      # @param params [Trophy::Types::UpsertedUser]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Trophy::Types::User]
      def create(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "POST",
          path: "users",
          body: Trophy::Types::UpsertedUser.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::User.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a single user.
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
      # @return [Trophy::Types::User]
      def get(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::User.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Identify a user.
      #
      # @param request_options [Hash]
      # @param params [Trophy::Types::UpdatedUser]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Trophy::Types::User]
      def identify(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "PUT",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}",
          body: Trophy::Types::UpdatedUser.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::User.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a user.
      #
      # @param request_options [Hash]
      # @param params [Trophy::Types::UpdatedUser]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Trophy::Types::User]
      def update(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "PATCH",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}",
          body: Trophy::Types::UpdatedUser.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::User.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a user's notification preferences.
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
      # @return [Trophy::Types::UserPreferencesResponse]
      def get_preferences(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/preferences",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::UserPreferencesResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update a user's notification and streak preferences. Streak preferences other than `streak.enabled` require
      # streak customization to be enabled in your Trophy dashboard settings.
      #
      # @param request_options [Hash]
      # @param params [Trophy::Users::Types::UpdateUserPreferencesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Trophy::Types::UserPreferencesResponse]
      def update_preferences(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request_data = Trophy::Users::Types::UpdateUserPreferencesRequest.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "PATCH",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/preferences",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::UserPreferencesResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a single user's progress against all active metrics.
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
      # @return [Array[Trophy::Types::MetricResponse]]
      def all_metrics(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/metrics",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Get a user's progress against a single active metric.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :key
      #
      # @return [Trophy::Types::MetricResponse]
      def single_metric(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/metrics/#{URI.encode_uri_component(params[:key].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Trophy::Types::MetricResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a summary of metric events over time for a user.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :key
      # @option params [Trophy::Users::Types::UsersMetricEventSummaryRequestAggregation] :aggregation
      # @option params [String] :start_date
      # @option params [String] :end_date
      #
      # @return [Array[Trophy::Users::Types::UsersMetricEventSummaryResponseItem]]
      def metric_event_summary(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["aggregation"] = params[:aggregation] if params.key?(:aggregation)
        query_params["startDate"] = params[:start_date] if params.key?(:start_date)
        query_params["endDate"] = params[:end_date] if params.key?(:end_date)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/metrics/#{URI.encode_uri_component(params[:key].to_s)}/event-summary",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Get a user's achievements.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :include_incomplete
      #
      # @return [Array[Trophy::Types::UserAchievementWithStatsResponse]]
      def achievements(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["includeIncomplete"] = params[:include_incomplete] if params.key?(:include_incomplete)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/achievements",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Get a user's streak data.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [Integer, nil] :history_periods
      #
      # @return [Trophy::Types::StreakResponse]
      def streak(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["historyPeriods"] = params[:history_periods] if params.key?(:history_periods)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/streak",
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
          Trophy::Types::StreakResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a user's points for a specific points system.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :key
      # @option params [Integer, nil] :awards
      #
      # @return [Trophy::Types::GetUserPointsResponse]
      def points(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["awards"] = params[:awards] if params.key?(:awards)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/points/#{URI.encode_uri_component(params[:key].to_s)}",
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
          Trophy::Types::GetUserPointsResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get active points boosts for a user in a specific points system. Returns both global boosts the user is eligible
      # for and user-specific boosts.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :key
      #
      # @return [Array[Trophy::Types::PointsBoost]]
      def points_boosts(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/points/#{URI.encode_uri_component(params[:key].to_s)}/boosts",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Get a summary of points awards over time for a user for a specific points system.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :key
      # @option params [Trophy::Users::Types::UsersPointsEventSummaryRequestAggregation] :aggregation
      # @option params [String] :start_date
      # @option params [String] :end_date
      #
      # @return [Array[Trophy::Users::Types::UsersPointsEventSummaryResponseItem]]
      def points_event_summary(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["aggregation"] = params[:aggregation] if params.key?(:aggregation)
        query_params["startDate"] = params[:start_date] if params.key?(:start_date)
        query_params["endDate"] = params[:end_date] if params.key?(:end_date)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/points/#{URI.encode_uri_component(params[:key].to_s)}/event-summary",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Trophy::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Get a user's rank, value, and daily ranking history for a specific leaderboard.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :key
      # @option params [String, nil] :run
      # @option params [Integer, nil] :num_events
      #
      # @return [Trophy::Types::UserLeaderboardResponseWithHistory]
      def leaderboard(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["run"] = params[:run] if params.key?(:run)
        query_params["numEvents"] = params[:num_events] if params.key?(:num_events)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/leaderboards/#{URI.encode_uri_component(params[:key].to_s)}",
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
          Trophy::Types::UserLeaderboardResponseWithHistory.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get a user's year-in-review wrapped data.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [Integer, nil] :year
      #
      # @return [Trophy::Types::WrappedResponse]
      def wrapped(request_options: {}, **params)
        params = Trophy::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["year"] = params[:year] if params.key?(:year)

        request = Trophy::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "users/#{URI.encode_uri_component(params[:id].to_s)}/wrapped",
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
          Trophy::Types::WrappedResponse.load(response.body)
        else
          error_class = Trophy::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
