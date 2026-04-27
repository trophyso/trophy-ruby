# frozen_string_literal: true

require_relative "admin_points_trigger_type"
require_relative "admin_points_trigger_status"
require_relative "admin_points_trigger_user_attributes_item"
require_relative "admin_points_trigger_event_attributes_item"
require_relative "admin_points_trigger_time_unit"
require "ostruct"
require "json"

module TrophyApiClient
  # A points trigger as returned from admin endpoints.
  class AdminPointsTrigger
    # @return [String] The UUID of the trigger.
    attr_reader :id
    # @return [TrophyApiClient::AdminPointsTriggerType] The type of trigger.
    attr_reader :type
    # @return [Integer] The number of points awarded or deducted when the trigger fires.
    attr_reader :points
    # @return [TrophyApiClient::AdminPointsTriggerStatus] The status of the trigger.
    attr_reader :status
    # @return [Array<TrophyApiClient::AdminPointsTriggerUserAttributesItem>] User attribute filters applied to the trigger.
    attr_reader :user_attributes
    # @return [String] The UUID of the metric. Only present for metric triggers.
    attr_reader :metric_id
    # @return [Integer] The metric threshold. Only present for metric triggers.
    attr_reader :metric_threshold
    # @return [Array<TrophyApiClient::AdminPointsTriggerEventAttributesItem>] Event attribute filters applied to the trigger. Only present for metric
    #  triggers.
    attr_reader :event_attributes
    # @return [String] The UUID of the achievement. Only present for achievement triggers.
    attr_reader :achievement_id
    # @return [Integer] The streak length. Only present for streak triggers.
    attr_reader :streak_length
    # @return [TrophyApiClient::AdminPointsTriggerTimeUnit] The time unit. Only present for time triggers.
    attr_reader :time_unit
    # @return [Integer] The time interval. Only present for time triggers.
    attr_reader :time_interval
    # @return [Boolean] Whether metric events that would reduce the user's points below zero are
    #  blocked.
    attr_reader :block_if_out_of_points
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the trigger.
    # @param type [TrophyApiClient::AdminPointsTriggerType] The type of trigger.
    # @param points [Integer] The number of points awarded or deducted when the trigger fires.
    # @param status [TrophyApiClient::AdminPointsTriggerStatus] The status of the trigger.
    # @param user_attributes [Array<TrophyApiClient::AdminPointsTriggerUserAttributesItem>] User attribute filters applied to the trigger.
    # @param metric_id [String] The UUID of the metric. Only present for metric triggers.
    # @param metric_threshold [Integer] The metric threshold. Only present for metric triggers.
    # @param event_attributes [Array<TrophyApiClient::AdminPointsTriggerEventAttributesItem>] Event attribute filters applied to the trigger. Only present for metric
    #  triggers.
    # @param achievement_id [String] The UUID of the achievement. Only present for achievement triggers.
    # @param streak_length [Integer] The streak length. Only present for streak triggers.
    # @param time_unit [TrophyApiClient::AdminPointsTriggerTimeUnit] The time unit. Only present for time triggers.
    # @param time_interval [Integer] The time interval. Only present for time triggers.
    # @param block_if_out_of_points [Boolean] Whether metric events that would reduce the user's points below zero are
    #  blocked.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminPointsTrigger]
    def initialize(id:, type:, points:, status:, user_attributes:, block_if_out_of_points:, metric_id: OMIT, metric_threshold: OMIT,
                   event_attributes: OMIT, achievement_id: OMIT, streak_length: OMIT, time_unit: OMIT, time_interval: OMIT, additional_properties: nil)
      @id = id
      @type = type
      @points = points
      @status = status
      @user_attributes = user_attributes
      @metric_id = metric_id if metric_id != OMIT
      @metric_threshold = metric_threshold if metric_threshold != OMIT
      @event_attributes = event_attributes if event_attributes != OMIT
      @achievement_id = achievement_id if achievement_id != OMIT
      @streak_length = streak_length if streak_length != OMIT
      @time_unit = time_unit if time_unit != OMIT
      @time_interval = time_interval if time_interval != OMIT
      @block_if_out_of_points = block_if_out_of_points
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "type": type,
        "points": points,
        "status": status,
        "userAttributes": user_attributes,
        "metricId": metric_id,
        "metricThreshold": metric_threshold,
        "eventAttributes": event_attributes,
        "achievementId": achievement_id,
        "streakLength": streak_length,
        "timeUnit": time_unit,
        "timeInterval": time_interval,
        "blockIfOutOfPoints": block_if_out_of_points
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AdminPointsTrigger
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminPointsTrigger]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      points = parsed_json["points"]
      status = parsed_json["status"]
      user_attributes = parsed_json["userAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsTriggerUserAttributesItem.from_json(json_object: item)
      end
      metric_id = parsed_json["metricId"]
      metric_threshold = parsed_json["metricThreshold"]
      event_attributes = parsed_json["eventAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsTriggerEventAttributesItem.from_json(json_object: item)
      end
      achievement_id = parsed_json["achievementId"]
      streak_length = parsed_json["streakLength"]
      time_unit = parsed_json["timeUnit"]
      time_interval = parsed_json["timeInterval"]
      block_if_out_of_points = parsed_json["blockIfOutOfPoints"]
      new(
        id: id,
        type: type,
        points: points,
        status: status,
        user_attributes: user_attributes,
        metric_id: metric_id,
        metric_threshold: metric_threshold,
        event_attributes: event_attributes,
        achievement_id: achievement_id,
        streak_length: streak_length,
        time_unit: time_unit,
        time_interval: time_interval,
        block_if_out_of_points: block_if_out_of_points,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdminPointsTrigger to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.type.is_a?(TrophyApiClient::AdminPointsTriggerType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.status.is_a?(TrophyApiClient::AdminPointsTriggerStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.user_attributes.is_a?(Array) != false || raise("Passed value for field obj.user_attributes is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.metric_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.metric_threshold is not the expected type, validation failed.")
      obj.event_attributes&.is_a?(Array) != false || raise("Passed value for field obj.event_attributes is not the expected type, validation failed.")
      obj.achievement_id&.is_a?(String) != false || raise("Passed value for field obj.achievement_id is not the expected type, validation failed.")
      obj.streak_length&.is_a?(Integer) != false || raise("Passed value for field obj.streak_length is not the expected type, validation failed.")
      obj.time_unit&.is_a?(TrophyApiClient::AdminPointsTriggerTimeUnit) != false || raise("Passed value for field obj.time_unit is not the expected type, validation failed.")
      obj.time_interval&.is_a?(Integer) != false || raise("Passed value for field obj.time_interval is not the expected type, validation failed.")
      obj.block_if_out_of_points.is_a?(Boolean) != false || raise("Passed value for field obj.block_if_out_of_points is not the expected type, validation failed.")
    end
  end
end
