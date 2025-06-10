# frozen_string_literal: true

require "json"
require_relative "metric_achievement_response"
require_relative "streak_achievement_response"

module TrophyApiClient
  class EventResponseMetricsItemCompletedItem
    # Deserialize a JSON object to an instance of
    #  EventResponseMetricsItemCompletedItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::EventResponseMetricsItemCompletedItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        TrophyApiClient::MetricAchievementResponse.validate_raw(obj: struct)
        return TrophyApiClient::MetricAchievementResponse.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        TrophyApiClient::StreakAchievementResponse.validate_raw(obj: struct)
        return TrophyApiClient::StreakAchievementResponse.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return TrophyApiClient::MetricAchievementResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return TrophyApiClient::StreakAchievementResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
