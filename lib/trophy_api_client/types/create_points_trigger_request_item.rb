# frozen_string_literal: true

require_relative "create_points_trigger_request_item_type"
require_relative "create_points_trigger_request_item_status"
require_relative "create_points_trigger_request_item_user_attributes_item"
require_relative "create_points_trigger_request_item_event_attributes_item"
require_relative "create_points_trigger_request_item_time_unit"
require "ostruct"
require "json"

module TrophyApiClient
  # A points trigger to create.
  class CreatePointsTriggerRequestItem
    # @return [TrophyApiClient::CreatePointsTriggerRequestItemType] The type of trigger.
    attr_reader :type
    # @return [Integer] The number of points to award or deduct when the trigger fires. Cannot be zero.
    attr_reader :points
    # @return [TrophyApiClient::CreatePointsTriggerRequestItemStatus] The status of the trigger. Defaults to 'inactive'.
    attr_reader :status
    # @return [Array<TrophyApiClient::CreatePointsTriggerRequestItemUserAttributesItem>] Optional user attribute filters for the trigger.
    attr_reader :user_attributes
    # @return [String] Required if type is `metric`. The UUID of the metric.
    attr_reader :metric_id
    # @return [Integer] Required if type is `metric`. The metric increment that triggers the points.
    attr_reader :metric_threshold
    # @return [Array<TrophyApiClient::CreatePointsTriggerRequestItemEventAttributesItem>] Optional event attribute filters. Only permitted if type is `metric`.
    attr_reader :event_attributes
    # @return [String] Required if type is `achievement`. The UUID of the achievement.
    attr_reader :achievement_id
    # @return [Integer] Required if type is `streak`. The number of streak periods that triggers the
    #  points.
    attr_reader :streak_length
    # @return [TrophyApiClient::CreatePointsTriggerRequestItemTimeUnit] Required if type is `time`. The unit for the time interval.
    attr_reader :time_unit
    # @return [Integer] Required if type is `time`. The number of time units between recurring awards.
    attr_reader :time_interval
    # @return [Boolean] Whether to block metric events that would reduce the user's points below zero.
    #  Defaults to false.
    attr_reader :block_if_out_of_points
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [TrophyApiClient::CreatePointsTriggerRequestItemType] The type of trigger.
    # @param points [Integer] The number of points to award or deduct when the trigger fires. Cannot be zero.
    # @param status [TrophyApiClient::CreatePointsTriggerRequestItemStatus] The status of the trigger. Defaults to 'inactive'.
    # @param user_attributes [Array<TrophyApiClient::CreatePointsTriggerRequestItemUserAttributesItem>] Optional user attribute filters for the trigger.
    # @param metric_id [String] Required if type is `metric`. The UUID of the metric.
    # @param metric_threshold [Integer] Required if type is `metric`. The metric increment that triggers the points.
    # @param event_attributes [Array<TrophyApiClient::CreatePointsTriggerRequestItemEventAttributesItem>] Optional event attribute filters. Only permitted if type is `metric`.
    # @param achievement_id [String] Required if type is `achievement`. The UUID of the achievement.
    # @param streak_length [Integer] Required if type is `streak`. The number of streak periods that triggers the
    #  points.
    # @param time_unit [TrophyApiClient::CreatePointsTriggerRequestItemTimeUnit] Required if type is `time`. The unit for the time interval.
    # @param time_interval [Integer] Required if type is `time`. The number of time units between recurring awards.
    # @param block_if_out_of_points [Boolean] Whether to block metric events that would reduce the user's points below zero.
    #  Defaults to false.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatePointsTriggerRequestItem]
    def initialize(type:, points:, status: OMIT, user_attributes: OMIT, metric_id: OMIT, metric_threshold: OMIT,
                   event_attributes: OMIT, achievement_id: OMIT, streak_length: OMIT, time_unit: OMIT, time_interval: OMIT, block_if_out_of_points: OMIT, additional_properties: nil)
      @type = type
      @points = points
      @status = status if status != OMIT
      @user_attributes = user_attributes if user_attributes != OMIT
      @metric_id = metric_id if metric_id != OMIT
      @metric_threshold = metric_threshold if metric_threshold != OMIT
      @event_attributes = event_attributes if event_attributes != OMIT
      @achievement_id = achievement_id if achievement_id != OMIT
      @streak_length = streak_length if streak_length != OMIT
      @time_unit = time_unit if time_unit != OMIT
      @time_interval = time_interval if time_interval != OMIT
      @block_if_out_of_points = block_if_out_of_points if block_if_out_of_points != OMIT
      @additional_properties = additional_properties
      @_field_set = {
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

    # Deserialize a JSON object to an instance of CreatePointsTriggerRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatePointsTriggerRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      points = parsed_json["points"]
      status = parsed_json["status"]
      user_attributes = parsed_json["userAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatePointsTriggerRequestItemUserAttributesItem.from_json(json_object: item)
      end
      metric_id = parsed_json["metricId"]
      metric_threshold = parsed_json["metricThreshold"]
      event_attributes = parsed_json["eventAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatePointsTriggerRequestItemEventAttributesItem.from_json(json_object: item)
      end
      achievement_id = parsed_json["achievementId"]
      streak_length = parsed_json["streakLength"]
      time_unit = parsed_json["timeUnit"]
      time_interval = parsed_json["timeInterval"]
      block_if_out_of_points = parsed_json["blockIfOutOfPoints"]
      new(
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

    # Serialize an instance of CreatePointsTriggerRequestItem to a JSON object
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
      obj.type.is_a?(TrophyApiClient::CreatePointsTriggerRequestItemType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.status&.is_a?(TrophyApiClient::CreatePointsTriggerRequestItemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.user_attributes&.is_a?(Array) != false || raise("Passed value for field obj.user_attributes is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.metric_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.metric_threshold is not the expected type, validation failed.")
      obj.event_attributes&.is_a?(Array) != false || raise("Passed value for field obj.event_attributes is not the expected type, validation failed.")
      obj.achievement_id&.is_a?(String) != false || raise("Passed value for field obj.achievement_id is not the expected type, validation failed.")
      obj.streak_length&.is_a?(Integer) != false || raise("Passed value for field obj.streak_length is not the expected type, validation failed.")
      obj.time_unit&.is_a?(TrophyApiClient::CreatePointsTriggerRequestItemTimeUnit) != false || raise("Passed value for field obj.time_unit is not the expected type, validation failed.")
      obj.time_interval&.is_a?(Integer) != false || raise("Passed value for field obj.time_interval is not the expected type, validation failed.")
      obj.block_if_out_of_points&.is_a?(Boolean) != false || raise("Passed value for field obj.block_if_out_of_points is not the expected type, validation failed.")
    end
  end
end
