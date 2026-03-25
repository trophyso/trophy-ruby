# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # A level within a points system.
  class PointsLevel
    # @return [String] The ID of the level
    attr_reader :id
    # @return [String] The unique key of the level
    attr_reader :key
    # @return [String] The name of the level
    attr_reader :name
    # @return [String] The description of the level
    attr_reader :description
    # @return [String] The URL of the badge image for the level
    attr_reader :badge_url
    # @return [Integer] The points threshold required to reach this level
    attr_reader :points
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the level
    # @param key [String] The unique key of the level
    # @param name [String] The name of the level
    # @param description [String] The description of the level
    # @param badge_url [String] The URL of the badge image for the level
    # @param points [Integer] The points threshold required to reach this level
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsLevel]
    def initialize(id:, key:, name:, description:, points:, badge_url: OMIT, additional_properties: nil)
      @id = id
      @key = key
      @name = name
      @description = description
      @badge_url = badge_url if badge_url != OMIT
      @points = points
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "badgeUrl": badge_url,
        "points": points
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PointsLevel
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsLevel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      key = parsed_json["key"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      badge_url = parsed_json["badgeUrl"]
      points = parsed_json["points"]
      new(
        id: id,
        key: key,
        name: name,
        description: description,
        badge_url: badge_url,
        points: points,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsLevel to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge_url&.is_a?(String) != false || raise("Passed value for field obj.badge_url is not the expected type, validation failed.")
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
    end
  end
end
