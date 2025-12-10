# frozen_string_literal: true

require_relative "wrapped_streak"
require_relative "completed_achievement_response"
require "ostruct"
require "json"

module TrophyApiClient
  # The user's activity data for the entire year.
  class WrappedEntireYear
    # @return [TrophyApiClient::WrappedStreak] The user's longest streak during the year.
    attr_reader :longest_streak
    # @return [Hash{String => TrophyApiClient::WrappedMetric}] The user's metrics during this period, keyed by metric key.
    attr_reader :metrics
    # @return [Hash{String => TrophyApiClient::WrappedPoints}] The user's points during this period, keyed by points system key.
    attr_reader :points
    # @return [Array<TrophyApiClient::CompletedAchievementResponse>] Achievements completed during this period.
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

    # @param longest_streak [TrophyApiClient::WrappedStreak] The user's longest streak during the year.
    # @param metrics [Hash{String => TrophyApiClient::WrappedMetric}] The user's metrics during this period, keyed by metric key.
    # @param points [Hash{String => TrophyApiClient::WrappedPoints}] The user's points during this period, keyed by points system key.
    # @param achievements [Array<TrophyApiClient::CompletedAchievementResponse>] Achievements completed during this period.
    # @param leaderboards [Hash{String => TrophyApiClient::UserLeaderboardResponse}] The user's best leaderboard rankings during this period, keyed by leaderboard
    #  key.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WrappedEntireYear]
    def initialize(longest_streak:, metrics:, points:, achievements:, leaderboards:, additional_properties: nil)
      @longest_streak = longest_streak
      @metrics = metrics
      @points = points
      @achievements = achievements
      @leaderboards = leaderboards
      @additional_properties = additional_properties
      @_field_set = {
        "longestStreak": longest_streak,
        "metrics": metrics,
        "points": points,
        "achievements": achievements,
        "leaderboards": leaderboards
      }
    end

    # Deserialize a JSON object to an instance of WrappedEntireYear
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WrappedEntireYear]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["longestStreak"].nil?
        longest_streak = nil
      else
        longest_streak = parsed_json["longestStreak"].to_json
        longest_streak = TrophyApiClient::WrappedStreak.from_json(json_object: longest_streak)
      end
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
        TrophyApiClient::CompletedAchievementResponse.from_json(json_object: item)
      end
      leaderboards = parsed_json["leaderboards"]&.transform_values do |value|
        value = value.to_json
        TrophyApiClient::UserLeaderboardResponse.from_json(json_object: value)
      end
      new(
        longest_streak: longest_streak,
        metrics: metrics,
        points: points,
        achievements: achievements,
        leaderboards: leaderboards,
        additional_properties: struct
      )
    end

    # Serialize an instance of WrappedEntireYear to a JSON object
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
      TrophyApiClient::WrappedStreak.validate_raw(obj: obj.longest_streak)
      obj.metrics.is_a?(Hash) != false || raise("Passed value for field obj.metrics is not the expected type, validation failed.")
      obj.points.is_a?(Hash) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.achievements.is_a?(Array) != false || raise("Passed value for field obj.achievements is not the expected type, validation failed.")
      obj.leaderboards.is_a?(Hash) != false || raise("Passed value for field obj.leaderboards is not the expected type, validation failed.")
    end
  end
end
