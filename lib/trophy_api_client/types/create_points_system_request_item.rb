# frozen_string_literal: true

require_relative "create_points_system_request_item_badge"
require_relative "create_points_level_request_item"
require_relative "create_points_boost_request_item"
require_relative "create_points_trigger_request_item"
require "ostruct"
require "json"

module TrophyApiClient
  # A points system to create. Optionally include sub-entities.
  class CreatePointsSystemRequestItem
    # @return [String] The points system name.
    attr_reader :name
    # @return [String] The points system key. Only alphanumeric characters, hyphens, and underscores
    #  are permitted.
    attr_reader :key
    # @return [String] A short description of the points system.
    attr_reader :description
    # @return [TrophyApiClient::CreatePointsSystemRequestItemBadge] An optional badge for the points system.
    attr_reader :badge
    # @return [Integer] Optional maximum points a user can earn.
    attr_reader :max_points
    # @return [Array<TrophyApiClient::CreatePointsLevelRequestItem>] Optional array of levels to create alongside the system.
    attr_reader :levels
    # @return [Array<TrophyApiClient::CreatePointsBoostRequestItem>] Optional array of boosts to create alongside the system.
    attr_reader :boosts
    # @return [Array<TrophyApiClient::CreatePointsTriggerRequestItem>] Optional array of triggers to create alongside the system.
    attr_reader :triggers
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The points system name.
    # @param key [String] The points system key. Only alphanumeric characters, hyphens, and underscores
    #  are permitted.
    # @param description [String] A short description of the points system.
    # @param badge [TrophyApiClient::CreatePointsSystemRequestItemBadge] An optional badge for the points system.
    # @param max_points [Integer] Optional maximum points a user can earn.
    # @param levels [Array<TrophyApiClient::CreatePointsLevelRequestItem>] Optional array of levels to create alongside the system.
    # @param boosts [Array<TrophyApiClient::CreatePointsBoostRequestItem>] Optional array of boosts to create alongside the system.
    # @param triggers [Array<TrophyApiClient::CreatePointsTriggerRequestItem>] Optional array of triggers to create alongside the system.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatePointsSystemRequestItem]
    def initialize(name:, key:, description: OMIT, badge: OMIT, max_points: OMIT, levels: OMIT, boosts: OMIT,
                   triggers: OMIT, additional_properties: nil)
      @name = name
      @key = key
      @description = description if description != OMIT
      @badge = badge if badge != OMIT
      @max_points = max_points if max_points != OMIT
      @levels = levels if levels != OMIT
      @boosts = boosts if boosts != OMIT
      @triggers = triggers if triggers != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "key": key,
        "description": description,
        "badge": badge,
        "maxPoints": max_points,
        "levels": levels,
        "boosts": boosts,
        "triggers": triggers
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreatePointsSystemRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatePointsSystemRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      key = parsed_json["key"]
      description = parsed_json["description"]
      if parsed_json["badge"].nil?
        badge = nil
      else
        badge = parsed_json["badge"].to_json
        badge = TrophyApiClient::CreatePointsSystemRequestItemBadge.from_json(json_object: badge)
      end
      max_points = parsed_json["maxPoints"]
      levels = parsed_json["levels"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatePointsLevelRequestItem.from_json(json_object: item)
      end
      boosts = parsed_json["boosts"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatePointsBoostRequestItem.from_json(json_object: item)
      end
      triggers = parsed_json["triggers"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatePointsTriggerRequestItem.from_json(json_object: item)
      end
      new(
        name: name,
        key: key,
        description: description,
        badge: badge,
        max_points: max_points,
        levels: levels,
        boosts: boosts,
        triggers: triggers,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatePointsSystemRequestItem to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge.nil? || TrophyApiClient::CreatePointsSystemRequestItemBadge.validate_raw(obj: obj.badge)
      obj.max_points&.is_a?(Integer) != false || raise("Passed value for field obj.max_points is not the expected type, validation failed.")
      obj.levels&.is_a?(Array) != false || raise("Passed value for field obj.levels is not the expected type, validation failed.")
      obj.boosts&.is_a?(Array) != false || raise("Passed value for field obj.boosts is not the expected type, validation failed.")
      obj.triggers&.is_a?(Array) != false || raise("Passed value for field obj.triggers is not the expected type, validation failed.")
    end
  end
end
