# frozen_string_literal: true

require_relative "patch_points_triggers_request_item_type"
require_relative "patch_points_triggers_request_item_status"
require_relative "patch_points_triggers_request_item_user_attributes_item"
require_relative "patch_points_triggers_request_item_event_attributes_item"
require_relative "patch_points_triggers_request_item_time_unit"
require "ostruct"
require "json"

module TrophyApiClient
  class PatchPointsTriggersRequestItem
    # @return [String] The UUID of the trigger to update.
    attr_reader :id
    # @return [TrophyApiClient::PatchPointsTriggersRequestItemType] Updated trigger type. Can only be changed when the trigger is inactive. Required
    #  fields for the new type must be provided.
    attr_reader :type
    # @return [Integer] Updated points value.
    attr_reader :points
    # @return [TrophyApiClient::PatchPointsTriggersRequestItemStatus] Updated status.
    attr_reader :status
    # @return [Array<TrophyApiClient::PatchPointsTriggersRequestItemUserAttributesItem>] Updated user attribute filters. Set to null to clear.
    attr_reader :user_attributes
    # @return [String] Updated metric ID. Only permitted for metric triggers.
    attr_reader :metric_id
    # @return [Integer] Updated metric threshold. Only permitted for metric triggers.
    attr_reader :metric_threshold
    # @return [Array<TrophyApiClient::PatchPointsTriggersRequestItemEventAttributesItem>] Updated event attribute filters. Only permitted for metric triggers. Set to null
    #  to clear.
    attr_reader :event_attributes
    # @return [String] Updated achievement ID. Only permitted for achievement triggers.
    attr_reader :achievement_id
    # @return [Integer] Updated streak length. Only permitted for streak triggers.
    attr_reader :streak_length
    # @return [TrophyApiClient::PatchPointsTriggersRequestItemTimeUnit] Updated time unit. Only permitted for time triggers.
    attr_reader :time_unit
    # @return [Integer] Updated time interval. Only permitted for time triggers.
    attr_reader :time_interval
    # @return [Boolean] Updated block-if-out-of-points setting.
    attr_reader :block_if_out_of_points
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the trigger to update.
    # @param type [TrophyApiClient::PatchPointsTriggersRequestItemType] Updated trigger type. Can only be changed when the trigger is inactive. Required
    #  fields for the new type must be provided.
    # @param points [Integer] Updated points value.
    # @param status [TrophyApiClient::PatchPointsTriggersRequestItemStatus] Updated status.
    # @param user_attributes [Array<TrophyApiClient::PatchPointsTriggersRequestItemUserAttributesItem>] Updated user attribute filters. Set to null to clear.
    # @param metric_id [String] Updated metric ID. Only permitted for metric triggers.
    # @param metric_threshold [Integer] Updated metric threshold. Only permitted for metric triggers.
    # @param event_attributes [Array<TrophyApiClient::PatchPointsTriggersRequestItemEventAttributesItem>] Updated event attribute filters. Only permitted for metric triggers. Set to null
    #  to clear.
    # @param achievement_id [String] Updated achievement ID. Only permitted for achievement triggers.
    # @param streak_length [Integer] Updated streak length. Only permitted for streak triggers.
    # @param time_unit [TrophyApiClient::PatchPointsTriggersRequestItemTimeUnit] Updated time unit. Only permitted for time triggers.
    # @param time_interval [Integer] Updated time interval. Only permitted for time triggers.
    # @param block_if_out_of_points [Boolean] Updated block-if-out-of-points setting.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PatchPointsTriggersRequestItem]
    def initialize(id:, type: OMIT, points: OMIT, status: OMIT, user_attributes: OMIT, metric_id: OMIT,
                   metric_threshold: OMIT, event_attributes: OMIT, achievement_id: OMIT, streak_length: OMIT, time_unit: OMIT, time_interval: OMIT, block_if_out_of_points: OMIT, additional_properties: nil)
      @id = id
      @type = type if type != OMIT
      @points = points if points != OMIT
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

    # Deserialize a JSON object to an instance of PatchPointsTriggersRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PatchPointsTriggersRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      points = parsed_json["points"]
      status = parsed_json["status"]
      user_attributes = parsed_json["userAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::PatchPointsTriggersRequestItemUserAttributesItem.from_json(json_object: item)
      end
      metric_id = parsed_json["metricId"]
      metric_threshold = parsed_json["metricThreshold"]
      event_attributes = parsed_json["eventAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::PatchPointsTriggersRequestItemEventAttributesItem.from_json(json_object: item)
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

    # Serialize an instance of PatchPointsTriggersRequestItem to a JSON object
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
      obj.type&.is_a?(TrophyApiClient::PatchPointsTriggersRequestItemType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.status&.is_a?(TrophyApiClient::PatchPointsTriggersRequestItemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.user_attributes&.is_a?(Array) != false || raise("Passed value for field obj.user_attributes is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.metric_threshold&.is_a?(Integer) != false || raise("Passed value for field obj.metric_threshold is not the expected type, validation failed.")
      obj.event_attributes&.is_a?(Array) != false || raise("Passed value for field obj.event_attributes is not the expected type, validation failed.")
      obj.achievement_id&.is_a?(String) != false || raise("Passed value for field obj.achievement_id is not the expected type, validation failed.")
      obj.streak_length&.is_a?(Integer) != false || raise("Passed value for field obj.streak_length is not the expected type, validation failed.")
      obj.time_unit&.is_a?(TrophyApiClient::PatchPointsTriggersRequestItemTimeUnit) != false || raise("Passed value for field obj.time_unit is not the expected type, validation failed.")
      obj.time_interval&.is_a?(Integer) != false || raise("Passed value for field obj.time_interval is not the expected type, validation failed.")
      obj.block_if_out_of_points&.is_a?(Boolean) != false || raise("Passed value for field obj.block_if_out_of_points is not the expected type, validation failed.")
    end
  end
end
