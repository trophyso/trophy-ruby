# frozen_string_literal: true

require "date"
require_relative "achievement_response_trigger"
require_relative "metric_event_streak_response"
require "ostruct"
require "json"

module TrophyApiClient
  class CompletedAchievementResponse
    # @return [DateTime] The date and time the achievement was completed, in ISO 8601 format.
    attr_reader :achieved_at
    # @return [String] The unique ID of the achievement.
    attr_reader :id
    # @return [String] The name of this achievement.
    attr_reader :name
    # @return [TrophyApiClient::AchievementResponseTrigger] The trigger of the achievement.
    attr_reader :trigger
    # @return [String] The description of this achievement.
    attr_reader :description
    # @return [String] The URL of the badge image for the achievement, if one has been uploaded.
    attr_reader :badge_url
    # @return [String] The key used to reference this achievement in the API (only applicable if
    #  trigger = 'api')
    attr_reader :key
    # @return [Integer] The length of the streak required to complete the achievement (only applicable
    #  if trigger = 'streak')
    attr_reader :streak_length
    # @return [String] The ID of the metric associated with this achievement (only applicable if
    #  trigger = 'metric')
    attr_reader :metric_id
    # @return [Float] The value of the metric required to complete the achievement (only applicable if
    #  trigger = 'metric')
    attr_reader :metric_value
    # @return [String] The name of the metric associated with this achievement (only applicable if
    #  trigger = 'metric')
    attr_reader :metric_name
    # @return [TrophyApiClient::MetricEventStreakResponse] The user's current streak for the metric, if the metric has streaks enabled.
    attr_reader :current_streak
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param achieved_at [DateTime] The date and time the achievement was completed, in ISO 8601 format.
    # @param id [String] The unique ID of the achievement.
    # @param name [String] The name of this achievement.
    # @param trigger [TrophyApiClient::AchievementResponseTrigger] The trigger of the achievement.
    # @param description [String] The description of this achievement.
    # @param badge_url [String] The URL of the badge image for the achievement, if one has been uploaded.
    # @param key [String] The key used to reference this achievement in the API (only applicable if
    #  trigger = 'api')
    # @param streak_length [Integer] The length of the streak required to complete the achievement (only applicable
    #  if trigger = 'streak')
    # @param metric_id [String] The ID of the metric associated with this achievement (only applicable if
    #  trigger = 'metric')
    # @param metric_value [Float] The value of the metric required to complete the achievement (only applicable if
    #  trigger = 'metric')
    # @param metric_name [String] The name of the metric associated with this achievement (only applicable if
    #  trigger = 'metric')
    # @param current_streak [TrophyApiClient::MetricEventStreakResponse] The user's current streak for the metric, if the metric has streaks enabled.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CompletedAchievementResponse]
    def initialize(id:, name:, trigger:, achieved_at: OMIT, description: OMIT, badge_url: OMIT, key: OMIT,
                   streak_length: OMIT, metric_id: OMIT, metric_value: OMIT, metric_name: OMIT, current_streak: OMIT, additional_properties: nil)
      @achieved_at = achieved_at if achieved_at != OMIT
      @id = id
      @name = name
      @trigger = trigger
      @description = description if description != OMIT
      @badge_url = badge_url if badge_url != OMIT
      @key = key if key != OMIT
      @streak_length = streak_length if streak_length != OMIT
      @metric_id = metric_id if metric_id != OMIT
      @metric_value = metric_value if metric_value != OMIT
      @metric_name = metric_name if metric_name != OMIT
      @current_streak = current_streak if current_streak != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "achievedAt": achieved_at,
        "id": id,
        "name": name,
        "trigger": trigger,
        "description": description,
        "badgeUrl": badge_url,
        "key": key,
        "streakLength": streak_length,
        "metricId": metric_id,
        "metricValue": metric_value,
        "metricName": metric_name,
        "currentStreak": current_streak
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CompletedAchievementResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CompletedAchievementResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      achieved_at = (DateTime.parse(parsed_json["achievedAt"]) unless parsed_json["achievedAt"].nil?)
      id = parsed_json["id"]
      name = parsed_json["name"]
      trigger = parsed_json["trigger"]
      description = parsed_json["description"]
      badge_url = parsed_json["badgeUrl"]
      key = parsed_json["key"]
      streak_length = parsed_json["streakLength"]
      metric_id = parsed_json["metricId"]
      metric_value = parsed_json["metricValue"]
      metric_name = parsed_json["metricName"]
      if parsed_json["currentStreak"].nil?
        current_streak = nil
      else
        current_streak = parsed_json["currentStreak"].to_json
        current_streak = TrophyApiClient::MetricEventStreakResponse.from_json(json_object: current_streak)
      end
      new(
        achieved_at: achieved_at,
        id: id,
        name: name,
        trigger: trigger,
        description: description,
        badge_url: badge_url,
        key: key,
        streak_length: streak_length,
        metric_id: metric_id,
        metric_value: metric_value,
        metric_name: metric_name,
        current_streak: current_streak,
        additional_properties: struct
      )
    end

    # Serialize an instance of CompletedAchievementResponse to a JSON object
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
      obj.achieved_at&.is_a?(DateTime) != false || raise("Passed value for field obj.achieved_at is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.trigger.is_a?(TrophyApiClient::AchievementResponseTrigger) != false || raise("Passed value for field obj.trigger is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge_url&.is_a?(String) != false || raise("Passed value for field obj.badge_url is not the expected type, validation failed.")
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.streak_length&.is_a?(Integer) != false || raise("Passed value for field obj.streak_length is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.metric_value&.is_a?(Float) != false || raise("Passed value for field obj.metric_value is not the expected type, validation failed.")
      obj.metric_name&.is_a?(String) != false || raise("Passed value for field obj.metric_name is not the expected type, validation failed.")
      obj.current_streak.nil? || TrophyApiClient::MetricEventStreakResponse.validate_raw(obj: obj.current_streak)
    end
  end
end
