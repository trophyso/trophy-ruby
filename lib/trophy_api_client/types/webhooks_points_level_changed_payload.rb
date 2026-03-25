# frozen_string_literal: true

require_relative "user"
require_relative "webhooks_points_level_changed_payload_points"
require_relative "points_level"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksPointsLevelChangedPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [TrophyApiClient::User] The user whose level changed.
    attr_reader :user
    # @return [TrophyApiClient::WebhooksPointsLevelChangedPayloadPoints] The points system in which the level changed.
    attr_reader :points
    # @return [TrophyApiClient::PointsLevel] The user's previous level, or null if the user had no level.
    attr_reader :previous_level
    # @return [TrophyApiClient::PointsLevel] The user's new level, or null if the user no longer has a level.
    attr_reader :new_level
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param user [TrophyApiClient::User] The user whose level changed.
    # @param points [TrophyApiClient::WebhooksPointsLevelChangedPayloadPoints] The points system in which the level changed.
    # @param previous_level [TrophyApiClient::PointsLevel] The user's previous level, or null if the user had no level.
    # @param new_level [TrophyApiClient::PointsLevel] The user's new level, or null if the user no longer has a level.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksPointsLevelChangedPayload]
    def initialize(type:, user:, points:, previous_level: OMIT, new_level: OMIT, additional_properties: nil)
      @type = type
      @user = user
      @points = points
      @previous_level = previous_level if previous_level != OMIT
      @new_level = new_level if new_level != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "user": user,
        "points": points,
        "previousLevel": previous_level,
        "newLevel": new_level
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WebhooksPointsLevelChangedPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksPointsLevelChangedPayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      if parsed_json["user"].nil?
        user = nil
      else
        user = parsed_json["user"].to_json
        user = TrophyApiClient::User.from_json(json_object: user)
      end
      if parsed_json["points"].nil?
        points = nil
      else
        points = parsed_json["points"].to_json
        points = TrophyApiClient::WebhooksPointsLevelChangedPayloadPoints.from_json(json_object: points)
      end
      if parsed_json["previousLevel"].nil?
        previous_level = nil
      else
        previous_level = parsed_json["previousLevel"].to_json
        previous_level = TrophyApiClient::PointsLevel.from_json(json_object: previous_level)
      end
      if parsed_json["newLevel"].nil?
        new_level = nil
      else
        new_level = parsed_json["newLevel"].to_json
        new_level = TrophyApiClient::PointsLevel.from_json(json_object: new_level)
      end
      new(
        type: type,
        user: user,
        points: points,
        previous_level: previous_level,
        new_level: new_level,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksPointsLevelChangedPayload to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      TrophyApiClient::User.validate_raw(obj: obj.user)
      TrophyApiClient::WebhooksPointsLevelChangedPayloadPoints.validate_raw(obj: obj.points)
      obj.previous_level.nil? || TrophyApiClient::PointsLevel.validate_raw(obj: obj.previous_level)
      obj.new_level.nil? || TrophyApiClient::PointsLevel.validate_raw(obj: obj.new_level)
    end
  end
end
