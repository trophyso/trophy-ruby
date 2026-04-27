# frozen_string_literal: true

require_relative "create_points_level_request_item_badge"
require "ostruct"
require "json"

module TrophyApiClient
  # A points level to create.
  class CreatePointsLevelRequestItem
    # @return [String] The name of the level.
    attr_reader :name
    # @return [String] A unique key for the level. Only alphanumeric characters, hyphens, and
    #  underscores are permitted.
    attr_reader :key
    # @return [Integer] The threshold points value for the level.
    attr_reader :points
    # @return [String] An optional description of the level.
    attr_reader :description
    # @return [TrophyApiClient::CreatePointsLevelRequestItemBadge] An optional badge for the level.
    attr_reader :badge
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the level.
    # @param key [String] A unique key for the level. Only alphanumeric characters, hyphens, and
    #  underscores are permitted.
    # @param points [Integer] The threshold points value for the level.
    # @param description [String] An optional description of the level.
    # @param badge [TrophyApiClient::CreatePointsLevelRequestItemBadge] An optional badge for the level.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatePointsLevelRequestItem]
    def initialize(name:, key:, points:, description: OMIT, badge: OMIT, additional_properties: nil)
      @name = name
      @key = key
      @points = points
      @description = description if description != OMIT
      @badge = badge if badge != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "key": key,
        "points": points,
        "description": description,
        "badge": badge
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreatePointsLevelRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatePointsLevelRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      key = parsed_json["key"]
      points = parsed_json["points"]
      description = parsed_json["description"]
      if parsed_json["badge"].nil?
        badge = nil
      else
        badge = parsed_json["badge"].to_json
        badge = TrophyApiClient::CreatePointsLevelRequestItemBadge.from_json(json_object: badge)
      end
      new(
        name: name,
        key: key,
        points: points,
        description: description,
        badge: badge,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatePointsLevelRequestItem to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge.nil? || TrophyApiClient::CreatePointsLevelRequestItemBadge.validate_raw(obj: obj.badge)
    end
  end
end
