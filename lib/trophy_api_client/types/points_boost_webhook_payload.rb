# frozen_string_literal: true

require_relative "points_boost_webhook_payload_status"
require_relative "points_boost_webhook_payload_rounding"
require "ostruct"
require "json"

module TrophyApiClient
  # Points boost payload sent in points.boost_started and points.boost_finished
  #  webhook events.
  class PointsBoostWebhookPayload
    # @return [String] The ID of the points boost.
    attr_reader :id
    # @return [String] The name of the points boost.
    attr_reader :name
    # @return [TrophyApiClient::PointsBoostWebhookPayloadStatus] The status of the points boost.
    attr_reader :status
    # @return [String] The customer-facing user ID that the boost is scoped to, or null for global
    #  boosts.
    attr_reader :user_id
    # @return [String] The ID of the points system this boost applies to.
    attr_reader :points_system_id
    # @return [String] The key of the points system this boost applies to.
    attr_reader :points_system_key
    # @return [String] The name of the points system this boost applies to.
    attr_reader :points_system_name
    # @return [String] The start date of the points boost (YYYY-MM-DD).
    attr_reader :start
    # @return [String] The end date of the points boost (YYYY-MM-DD), or null if open-ended.
    attr_reader :end_
    # @return [Float] The multiplier applied to points during the boost.
    attr_reader :multiplier
    # @return [TrophyApiClient::PointsBoostWebhookPayloadRounding] The rounding method applied to boosted points.
    attr_reader :rounding
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the points boost.
    # @param name [String] The name of the points boost.
    # @param status [TrophyApiClient::PointsBoostWebhookPayloadStatus] The status of the points boost.
    # @param user_id [String] The customer-facing user ID that the boost is scoped to, or null for global
    #  boosts.
    # @param points_system_id [String] The ID of the points system this boost applies to.
    # @param points_system_key [String] The key of the points system this boost applies to.
    # @param points_system_name [String] The name of the points system this boost applies to.
    # @param start [String] The start date of the points boost (YYYY-MM-DD).
    # @param end_ [String] The end date of the points boost (YYYY-MM-DD), or null if open-ended.
    # @param multiplier [Float] The multiplier applied to points during the boost.
    # @param rounding [TrophyApiClient::PointsBoostWebhookPayloadRounding] The rounding method applied to boosted points.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsBoostWebhookPayload]
    def initialize(id:, name:, status:, points_system_id:, points_system_key:, points_system_name:, start:,
                   multiplier:, rounding:, user_id: OMIT, end_: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @status = status
      @user_id = user_id if user_id != OMIT
      @points_system_id = points_system_id
      @points_system_key = points_system_key
      @points_system_name = points_system_name
      @start = start
      @end_ = end_ if end_ != OMIT
      @multiplier = multiplier
      @rounding = rounding
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "status": status,
        "userId": user_id,
        "pointsSystemId": points_system_id,
        "pointsSystemKey": points_system_key,
        "pointsSystemName": points_system_name,
        "start": start,
        "end": end_,
        "multiplier": multiplier,
        "rounding": rounding
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PointsBoostWebhookPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsBoostWebhookPayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      status = parsed_json["status"]
      user_id = parsed_json["userId"]
      points_system_id = parsed_json["pointsSystemId"]
      points_system_key = parsed_json["pointsSystemKey"]
      points_system_name = parsed_json["pointsSystemName"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      multiplier = parsed_json["multiplier"]
      rounding = parsed_json["rounding"]
      new(
        id: id,
        name: name,
        status: status,
        user_id: user_id,
        points_system_id: points_system_id,
        points_system_key: points_system_key,
        points_system_name: points_system_name,
        start: start,
        end_: end_,
        multiplier: multiplier,
        rounding: rounding,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsBoostWebhookPayload to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status.is_a?(TrophyApiClient::PointsBoostWebhookPayloadStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.user_id&.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
      obj.points_system_id.is_a?(String) != false || raise("Passed value for field obj.points_system_id is not the expected type, validation failed.")
      obj.points_system_key.is_a?(String) != false || raise("Passed value for field obj.points_system_key is not the expected type, validation failed.")
      obj.points_system_name.is_a?(String) != false || raise("Passed value for field obj.points_system_name is not the expected type, validation failed.")
      obj.start.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.multiplier.is_a?(Float) != false || raise("Passed value for field obj.multiplier is not the expected type, validation failed.")
      obj.rounding.is_a?(TrophyApiClient::PointsBoostWebhookPayloadRounding) != false || raise("Passed value for field obj.rounding is not the expected type, validation failed.")
    end
  end
end
