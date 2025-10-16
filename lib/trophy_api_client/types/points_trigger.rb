# frozen_string_literal: true

require_relative "points_trigger_type"
require_relative "points_trigger_time_unit"
require "ostruct"
require "json"

module TrophyApiClient
  class PointsTrigger
    # @return [String] The ID of the trigger
    attr_reader :id
    # @return [TrophyApiClient::PointsTriggerType] The type of trigger
    attr_reader :type
    # @return [Integer] The points awarded by this trigger.
    attr_reader :points
    # @return [String] If the trigger has type 'metric', the name of the metric
    attr_reader :metric_name
    # @return [Integer] If the trigger has type 'metric', the threshold of the metric that triggers the
    #  points
    attr_reader :metric_threshold
    # @return [Integer] If the trigger has type 'streak', the threshold of the streak that triggers the
    #  points
    attr_reader :streak_length_threshold
    # @return [String] If the trigger has type 'achievement', the name of the achievement
    attr_reader :achievement_name
    # @return [TrophyApiClient::PointsTriggerTimeUnit] If the trigger has type 'time', the unit of time after which to award points
    attr_reader :time_unit
    # @return [Integer] If the trigger has type 'time', the numer of units of timeUnit after which to
    #  award points
    attr_reader :time_interval
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the trigger
    # @param type [TrophyApiClient::PointsTriggerType] The type of trigger
    # @param points [Integer] The points awarded by this trigger.
    # @param metric_name [String] If the trigger has type 'metric', the name of the metric
    # @param metric_threshold [Integer] If the trigger has type 'metric', the threshold of the metric that triggers the
    #  points
    # @param streak_length_threshold [Integer] If the trigger has type 'streak', the threshold of the streak that triggers the
    #  points
    # @param achievement_name [String] If the trigger has type 'achievement', the name of the achievement
    # @param time_unit [TrophyApiClient::PointsTriggerTimeUnit] If the trigger has type 'time', the unit of time after which to award points
    # @param time_interval [Integer] If the trigger has type 'time', the numer of units of timeUnit after which to
    #  award points
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsTrigger]
    def initialize(id: OMIT, type: OMIT, points: OMIT, metric_name: OMIT, metric_threshold: OMIT,
                   streak_length_threshold: OMIT, achievement_name: OMIT, time_unit: OMIT, time_interval: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @type = type if type != OMIT
      @points = points if points != OMIT
      @metric_name = metric_name if metric_name != OMIT
      @metric_threshold = metric_threshold if metric_threshold != OMIT
      @streak_length_threshold = streak_length_threshold if streak_length_threshold != OMIT
      @achievement_name = achievement_name if achievement_name != OMIT
      @time_unit = time_unit if time_unit != OMIT
      @time_interval = time_interval if time_interval != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "type": type,
        "points": points,
        "metricName": metric_name,
        "metricThreshold": metric_threshold,
        "streakLengthThreshold": streak_length_threshold,
        "achievementName": achievement_name,
        "timeUnit": time_unit,
        "timeInterval": time_interval
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PointsTrigger
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsTrigger]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      points = parsed_json["points"]
      metric_name = parsed_json["metricName"]
      metric_threshold = parsed_json["metricThreshold"]
      streak_length_threshold = parsed_json["streakLengthThreshold"]
      achievement_name = parsed_json["achievementName"]
      time_unit = parsed_json["timeUnit"]
      time_interval = parsed_json["timeInterval"]
      new(
        id: id,
        type: type,
        points: points,
        metric_name: metric_name,
        metric_threshold: metric_threshold,
        streak_length_threshold: streak_length_threshold,
        achievement_name: achievement_name,
        time_unit: time_unit,
        time_interval: time_interval,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsTrigger to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.type&.is_a?(TrophyApiClient::PointsTriggerType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.metric_name&.is_a?(String) != false || raise("Passed value for field obj.metric_name is not the expected type, validation failed.")
      obj.metric_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.metric_threshold is not the expected type, validation failed.")
      obj.streak_length_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.streak_length_threshold is not the expected type, validation failed.")
      obj.achievement_name&.is_a?(String) != false || raise("Passed value for field obj.achievement_name is not the expected type, validation failed.")
      obj.time_unit&.is_a?(TrophyApiClient::PointsTriggerTimeUnit) != false || raise("Passed value for field obj.time_unit is not the expected type, validation failed.")
      obj.time_interval&.is_a?(Integer) != false || raise("Passed value for field obj.time_interval is not the expected type, validation failed.")
    end
  end
end
