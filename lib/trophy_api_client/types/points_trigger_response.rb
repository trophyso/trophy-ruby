# frozen_string_literal: true

require_relative "points_trigger_response_type"
require_relative "points_trigger_response_status"
require "date"
require "ostruct"
require "json"

module TrophyApiClient
  class PointsTriggerResponse
    # @return [String] The unique ID of the trigger.
    attr_reader :id
    # @return [TrophyApiClient::PointsTriggerResponseType] The type of trigger.
    attr_reader :type
    # @return [Float] The points awarded by this trigger.
    attr_reader :points
    # @return [TrophyApiClient::PointsTriggerResponseStatus] The status of the trigger.
    attr_reader :status
    # @return [String] The unique ID of the achievement associated with this trigger, if the trigger is
    #  an achievement.
    attr_reader :achievement_id
    # @return [String] The unique ID of the metric associated with this trigger, if the trigger is a
    #  metric.
    attr_reader :metric_id
    # @return [Float] The amount that a user must increase the metric to earn the points, if the
    #  trigger is a metric.
    attr_reader :metric_threshold
    # @return [Float] The number of consecutive streak periods that a user must complete to earn the
    #  points, if the trigger is a streak.
    attr_reader :streak_length_threshold
    # @return [String] The name of the metric associated with this trigger, if the trigger is a metric.
    attr_reader :metric_name
    # @return [String] The name of the achievement associated with this trigger, if the trigger is an
    #  achievement.
    attr_reader :achievement_name
    # @return [DateTime] The date and time the trigger was created, in ISO 8601 format.
    attr_reader :created
    # @return [DateTime] The date and time the trigger was last updated, in ISO 8601 format.
    attr_reader :updated
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique ID of the trigger.
    # @param type [TrophyApiClient::PointsTriggerResponseType] The type of trigger.
    # @param points [Float] The points awarded by this trigger.
    # @param status [TrophyApiClient::PointsTriggerResponseStatus] The status of the trigger.
    # @param achievement_id [String] The unique ID of the achievement associated with this trigger, if the trigger is
    #  an achievement.
    # @param metric_id [String] The unique ID of the metric associated with this trigger, if the trigger is a
    #  metric.
    # @param metric_threshold [Float] The amount that a user must increase the metric to earn the points, if the
    #  trigger is a metric.
    # @param streak_length_threshold [Float] The number of consecutive streak periods that a user must complete to earn the
    #  points, if the trigger is a streak.
    # @param metric_name [String] The name of the metric associated with this trigger, if the trigger is a metric.
    # @param achievement_name [String] The name of the achievement associated with this trigger, if the trigger is an
    #  achievement.
    # @param created [DateTime] The date and time the trigger was created, in ISO 8601 format.
    # @param updated [DateTime] The date and time the trigger was last updated, in ISO 8601 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsTriggerResponse]
    def initialize(id: OMIT, type: OMIT, points: OMIT, status: OMIT, achievement_id: OMIT, metric_id: OMIT,
                   metric_threshold: OMIT, streak_length_threshold: OMIT, metric_name: OMIT, achievement_name: OMIT, created: OMIT, updated: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @type = type if type != OMIT
      @points = points if points != OMIT
      @status = status if status != OMIT
      @achievement_id = achievement_id if achievement_id != OMIT
      @metric_id = metric_id if metric_id != OMIT
      @metric_threshold = metric_threshold if metric_threshold != OMIT
      @streak_length_threshold = streak_length_threshold if streak_length_threshold != OMIT
      @metric_name = metric_name if metric_name != OMIT
      @achievement_name = achievement_name if achievement_name != OMIT
      @created = created if created != OMIT
      @updated = updated if updated != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "type": type,
        "points": points,
        "status": status,
        "achievementId": achievement_id,
        "metricId": metric_id,
        "metricThreshold": metric_threshold,
        "streakLengthThreshold": streak_length_threshold,
        "metricName": metric_name,
        "achievementName": achievement_name,
        "created": created,
        "updated": updated
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PointsTriggerResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsTriggerResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      points = parsed_json["points"]
      status = parsed_json["status"]
      achievement_id = parsed_json["achievementId"]
      metric_id = parsed_json["metricId"]
      metric_threshold = parsed_json["metricThreshold"]
      streak_length_threshold = parsed_json["streakLengthThreshold"]
      metric_name = parsed_json["metricName"]
      achievement_name = parsed_json["achievementName"]
      created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
      updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
      new(
        id: id,
        type: type,
        points: points,
        status: status,
        achievement_id: achievement_id,
        metric_id: metric_id,
        metric_threshold: metric_threshold,
        streak_length_threshold: streak_length_threshold,
        metric_name: metric_name,
        achievement_name: achievement_name,
        created: created,
        updated: updated,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsTriggerResponse to a JSON object
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
      obj.type&.is_a?(TrophyApiClient::PointsTriggerResponseType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.points&.is_a?(Float) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.status&.is_a?(TrophyApiClient::PointsTriggerResponseStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.achievement_id&.is_a?(String) != false || raise("Passed value for field obj.achievement_id is not the expected type, validation failed.")
      obj.metric_id&.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.metric_threshold&.is_a?(Float) != false || raise("Passed value for field obj.metric_threshold is not the expected type, validation failed.")
      obj.streak_length_threshold&.is_a?(Float) != false || raise("Passed value for field obj.streak_length_threshold is not the expected type, validation failed.")
      obj.metric_name&.is_a?(String) != false || raise("Passed value for field obj.metric_name is not the expected type, validation failed.")
      obj.achievement_name&.is_a?(String) != false || raise("Passed value for field obj.achievement_name is not the expected type, validation failed.")
      obj.created&.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated&.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
    end
  end
end
