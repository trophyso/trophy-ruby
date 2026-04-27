# frozen_string_literal: true

require_relative "admin_points_level_badge"
require "ostruct"
require "json"

module TrophyApiClient
  # A points level as returned from admin endpoints.
  class AdminPointsLevel
    # @return [String] The UUID of the level.
    attr_reader :id
    # @return [String] The name of the level.
    attr_reader :name
    # @return [String] The level key.
    attr_reader :key
    # @return [Integer] The threshold points value for the level.
    attr_reader :points
    # @return [String] The level description.
    attr_reader :description
    # @return [TrophyApiClient::AdminPointsLevelBadge] The badge for the level, or null if no badge is set.
    attr_reader :badge
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the level.
    # @param name [String] The name of the level.
    # @param key [String] The level key.
    # @param points [Integer] The threshold points value for the level.
    # @param description [String] The level description.
    # @param badge [TrophyApiClient::AdminPointsLevelBadge] The badge for the level, or null if no badge is set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminPointsLevel]
    def initialize(id:, name:, key:, points:, description:, badge: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @key = key
      @points = points
      @description = description
      @badge = badge if badge != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "key": key,
        "points": points,
        "description": description,
        "badge": badge
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AdminPointsLevel
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminPointsLevel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      key = parsed_json["key"]
      points = parsed_json["points"]
      description = parsed_json["description"]
      if parsed_json["badge"].nil?
        badge = nil
      else
        badge = parsed_json["badge"].to_json
        badge = TrophyApiClient::AdminPointsLevelBadge.from_json(json_object: badge)
      end
      new(
        id: id,
        name: name,
        key: key,
        points: points,
        description: description,
        badge: badge,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdminPointsLevel to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge.nil? || TrophyApiClient::AdminPointsLevelBadge.validate_raw(obj: obj.badge)
    end
  end
end
