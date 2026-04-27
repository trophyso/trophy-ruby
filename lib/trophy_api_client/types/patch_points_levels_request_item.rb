# frozen_string_literal: true

require_relative "patch_points_levels_request_item_badge"
require "ostruct"
require "json"

module TrophyApiClient
  class PatchPointsLevelsRequestItem
    # @return [String] The UUID of the level to update.
    attr_reader :id
    # @return [String] The updated level name.
    attr_reader :name
    # @return [Integer] The updated threshold points value.
    attr_reader :points
    # @return [String] The updated level description.
    attr_reader :description
    # @return [TrophyApiClient::PatchPointsLevelsRequestItemBadge] The updated badge, or `null` to clear it.
    attr_reader :badge
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the level to update.
    # @param name [String] The updated level name.
    # @param points [Integer] The updated threshold points value.
    # @param description [String] The updated level description.
    # @param badge [TrophyApiClient::PatchPointsLevelsRequestItemBadge] The updated badge, or `null` to clear it.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PatchPointsLevelsRequestItem]
    def initialize(id:, name: OMIT, points: OMIT, description: OMIT, badge: OMIT, additional_properties: nil)
      @id = id
      @name = name if name != OMIT
      @points = points if points != OMIT
      @description = description if description != OMIT
      @badge = badge if badge != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "points": points,
        "description": description,
        "badge": badge
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PatchPointsLevelsRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PatchPointsLevelsRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      points = parsed_json["points"]
      description = parsed_json["description"]
      if parsed_json["badge"].nil?
        badge = nil
      else
        badge = parsed_json["badge"].to_json
        badge = TrophyApiClient::PatchPointsLevelsRequestItemBadge.from_json(json_object: badge)
      end
      new(
        id: id,
        name: name,
        points: points,
        description: description,
        badge: badge,
        additional_properties: struct
      )
    end

    # Serialize an instance of PatchPointsLevelsRequestItem to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge.nil? || TrophyApiClient::PatchPointsLevelsRequestItemBadge.validate_raw(obj: obj.badge)
    end
  end
end
