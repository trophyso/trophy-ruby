# frozen_string_literal: true

require_relative "points_trigger_response"
require "ostruct"
require "json"

module TrophyApiClient
  class PointsSystemResponse
    # @return [String] The unique ID of the points system.
    attr_reader :id
    # @return [String] The name of the points system.
    attr_reader :name
    # @return [String] The description of the points system.
    attr_reader :description
    # @return [String] The URL of the badge image for the points system, if one has been uploaded.
    attr_reader :badge_url
    # @return [Float] The maximum number of points a user can be awarded in this points system
    attr_reader :max_points
    # @return [Array<TrophyApiClient::PointsTriggerResponse>] Array of active triggers for this points system.
    attr_reader :triggers
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique ID of the points system.
    # @param name [String] The name of the points system.
    # @param description [String] The description of the points system.
    # @param badge_url [String] The URL of the badge image for the points system, if one has been uploaded.
    # @param max_points [Float] The maximum number of points a user can be awarded in this points system
    # @param triggers [Array<TrophyApiClient::PointsTriggerResponse>] Array of active triggers for this points system.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsSystemResponse]
    def initialize(id:, name:, triggers:, description: OMIT, badge_url: OMIT, max_points: OMIT,
                   additional_properties: nil)
      @id = id
      @name = name
      @description = description if description != OMIT
      @badge_url = badge_url if badge_url != OMIT
      @max_points = max_points if max_points != OMIT
      @triggers = triggers
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "description": description,
        "badgeUrl": badge_url,
        "maxPoints": max_points,
        "triggers": triggers
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PointsSystemResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsSystemResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      badge_url = parsed_json["badgeUrl"]
      max_points = parsed_json["maxPoints"]
      triggers = parsed_json["triggers"]&.map do |item|
        item = item.to_json
        TrophyApiClient::PointsTriggerResponse.from_json(json_object: item)
      end
      new(
        id: id,
        name: name,
        description: description,
        badge_url: badge_url,
        max_points: max_points,
        triggers: triggers,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsSystemResponse to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge_url&.is_a?(String) != false || raise("Passed value for field obj.badge_url is not the expected type, validation failed.")
      obj.max_points&.is_a?(Float) != false || raise("Passed value for field obj.max_points is not the expected type, validation failed.")
      obj.triggers.is_a?(Array) != false || raise("Passed value for field obj.triggers is not the expected type, validation failed.")
    end
  end
end
