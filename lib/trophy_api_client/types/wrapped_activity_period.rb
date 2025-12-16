# frozen_string_literal: true

require_relative "user_achievement_response"
require "ostruct"
require "json"

module TrophyApiClient
  # Activity data for a specific period (day, week, month, or year).
  class WrappedActivityPeriod
    # @return [Hash{String => TrophyApiClient::WrappedMetric}] The user's metrics during this period, keyed by metric key.
    attr_reader :metrics
    # @return [Hash{String => TrophyApiClient::WrappedPoints}] The user's points during this period, keyed by points system key.
    attr_reader :points
    # @return [Array<TrophyApiClient::UserAchievementResponse>] Achievements completed during this period.
    attr_reader :achievements
    # @return [Hash{String => TrophyApiClient::UserLeaderboardResponse}] The user's best leaderboard rankings during this period, keyed by leaderboard
    #  key.
    attr_reader :leaderboards
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param metrics [Hash{String => TrophyApiClient::WrappedMetric}] The user's metrics during this period, keyed by metric key.
    # @param points [Hash{String => TrophyApiClient::WrappedPoints}] The user's points during this period, keyed by points system key.
    # @param achievements [Array<TrophyApiClient::UserAchievementResponse>] Achievements completed during this period.
    # @param leaderboards [Hash{String => TrophyApiClient::UserLeaderboardResponse}] The user's best leaderboard rankings during this period, keyed by leaderboard
    #  key.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WrappedActivityPeriod]
    def initialize(metrics:, points:, achievements:, leaderboards:, additional_properties: nil)
      @metrics = metrics
      @points = points
      @achievements = achievements
      @leaderboards = leaderboards
      @additional_properties = additional_properties
      @_field_set = { "metrics": metrics, "points": points, "achievements": achievements, "leaderboards": leaderboards }
    end

    # Deserialize a JSON object to an instance of WrappedActivityPeriod
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WrappedActivityPeriod]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      metrics = parsed_json["metrics"]&.transform_values do |value|
        value = value.to_json
        TrophyApiClient::WrappedMetric.from_json(json_object: value)
      end
      points = parsed_json["points"]&.transform_values do |value|
        value = value.to_json
        TrophyApiClient::WrappedPoints.from_json(json_object: value)
      end
      achievements = parsed_json["achievements"]&.map do |item|
        item = item.to_json
        TrophyApiClient::UserAchievementResponse.from_json(json_object: item)
      end
      leaderboards = parsed_json["leaderboards"]&.transform_values do |value|
        value = value.to_json
        TrophyApiClient::UserLeaderboardResponse.from_json(json_object: value)
      end
      new(
        metrics: metrics,
        points: points,
        achievements: achievements,
        leaderboards: leaderboards,
        additional_properties: struct
      )
    end

    # Serialize an instance of WrappedActivityPeriod to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.metrics.is_a?(Hash) != false || raise("Passed value for field obj.metrics is not the expected type, validation failed.")
      obj.points.is_a?(Hash) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.achievements.is_a?(Array) != false || raise("Passed value for field obj.achievements is not the expected type, validation failed.")
      obj.leaderboards.is_a?(Hash) != false || raise("Passed value for field obj.leaderboards is not the expected type, validation failed.")
    end
  end
end
