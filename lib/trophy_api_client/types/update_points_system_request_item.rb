# frozen_string_literal: true

require_relative "update_points_system_request_item_badge"
require "ostruct"
require "json"

module TrophyApiClient
  # A points system update object. Only id is required; all other fields are
  #  optional.
  class UpdatePointsSystemRequestItem
    # @return [String] The UUID of the points system to update.
    attr_reader :id
    # @return [String] Updated name.
    attr_reader :name
    # @return [String] Updated description.
    attr_reader :description
    # @return [TrophyApiClient::UpdatePointsSystemRequestItemBadge] Updated badge. Set to null to remove.
    attr_reader :badge
    # @return [Integer] Updated max points. Set to null to remove.
    attr_reader :max_points
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the points system to update.
    # @param name [String] Updated name.
    # @param description [String] Updated description.
    # @param badge [TrophyApiClient::UpdatePointsSystemRequestItemBadge] Updated badge. Set to null to remove.
    # @param max_points [Integer] Updated max points. Set to null to remove.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::UpdatePointsSystemRequestItem]
    def initialize(id:, name: OMIT, description: OMIT, badge: OMIT, max_points: OMIT, additional_properties: nil)
      @id = id
      @name = name if name != OMIT
      @description = description if description != OMIT
      @badge = badge if badge != OMIT
      @max_points = max_points if max_points != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "description": description,
        "badge": badge,
        "maxPoints": max_points
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdatePointsSystemRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::UpdatePointsSystemRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      if parsed_json["badge"].nil?
        badge = nil
      else
        badge = parsed_json["badge"].to_json
        badge = TrophyApiClient::UpdatePointsSystemRequestItemBadge.from_json(json_object: badge)
      end
      max_points = parsed_json["maxPoints"]
      new(
        id: id,
        name: name,
        description: description,
        badge: badge,
        max_points: max_points,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdatePointsSystemRequestItem to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge.nil? || TrophyApiClient::UpdatePointsSystemRequestItemBadge.validate_raw(obj: obj.badge)
      obj.max_points&.is_a?(Integer) != false || raise("Passed value for field obj.max_points is not the expected type, validation failed.")
    end
  end
end
