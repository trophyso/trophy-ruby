# frozen_string_literal: true

require_relative "admin_points_level"
require_relative "admin_points_boost"
require_relative "admin_points_trigger"
require_relative "admin_points_system_status"
require_relative "admin_points_system_badge"
require "ostruct"
require "json"

module TrophyApiClient
  # A points system returned from the creation endpoint. Extends AdminPointsSystem
  #  with optional sub-entity arrays that are present when those sub-entities were
  #  included in the creation request.
  class CreatedAdminPointsSystem
    # @return [Array<TrophyApiClient::AdminPointsLevel>] Levels created alongside the system. Present when levels were provided in the
    #  request.
    attr_reader :levels
    # @return [Array<TrophyApiClient::AdminPointsBoost>] Boosts created alongside the system. Present when boosts were provided in the
    #  request.
    attr_reader :boosts
    # @return [Array<TrophyApiClient::AdminPointsTrigger>] Triggers created alongside the system. Present when triggers were provided in
    #  the request.
    attr_reader :triggers
    # @return [String] The UUID of the points system.
    attr_reader :id
    # @return [String] The points system name.
    attr_reader :name
    # @return [String] The points system key.
    attr_reader :key
    # @return [String] The points system description.
    attr_reader :description
    # @return [TrophyApiClient::AdminPointsSystemStatus] The points system status.
    attr_reader :status
    # @return [TrophyApiClient::AdminPointsSystemBadge] The badge for the points system.
    attr_reader :badge
    # @return [Integer] The maximum points a user can earn.
    attr_reader :max_points
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param levels [Array<TrophyApiClient::AdminPointsLevel>] Levels created alongside the system. Present when levels were provided in the
    #  request.
    # @param boosts [Array<TrophyApiClient::AdminPointsBoost>] Boosts created alongside the system. Present when boosts were provided in the
    #  request.
    # @param triggers [Array<TrophyApiClient::AdminPointsTrigger>] Triggers created alongside the system. Present when triggers were provided in
    #  the request.
    # @param id [String] The UUID of the points system.
    # @param name [String] The points system name.
    # @param key [String] The points system key.
    # @param description [String] The points system description.
    # @param status [TrophyApiClient::AdminPointsSystemStatus] The points system status.
    # @param badge [TrophyApiClient::AdminPointsSystemBadge] The badge for the points system.
    # @param max_points [Integer] The maximum points a user can earn.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatedAdminPointsSystem]
    def initialize(id:, name:, key:, description:, status:, levels: OMIT, boosts: OMIT, triggers: OMIT, badge: OMIT,
                   max_points: OMIT, additional_properties: nil)
      @levels = levels if levels != OMIT
      @boosts = boosts if boosts != OMIT
      @triggers = triggers if triggers != OMIT
      @id = id
      @name = name
      @key = key
      @description = description
      @status = status
      @badge = badge if badge != OMIT
      @max_points = max_points if max_points != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "levels": levels,
        "boosts": boosts,
        "triggers": triggers,
        "id": id,
        "name": name,
        "key": key,
        "description": description,
        "status": status,
        "badge": badge,
        "maxPoints": max_points
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreatedAdminPointsSystem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatedAdminPointsSystem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      levels = parsed_json["levels"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsLevel.from_json(json_object: item)
      end
      boosts = parsed_json["boosts"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsBoost.from_json(json_object: item)
      end
      triggers = parsed_json["triggers"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsTrigger.from_json(json_object: item)
      end
      id = parsed_json["id"]
      name = parsed_json["name"]
      key = parsed_json["key"]
      description = parsed_json["description"]
      status = parsed_json["status"]
      if parsed_json["badge"].nil?
        badge = nil
      else
        badge = parsed_json["badge"].to_json
        badge = TrophyApiClient::AdminPointsSystemBadge.from_json(json_object: badge)
      end
      max_points = parsed_json["maxPoints"]
      new(
        levels: levels,
        boosts: boosts,
        triggers: triggers,
        id: id,
        name: name,
        key: key,
        description: description,
        status: status,
        badge: badge,
        max_points: max_points,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatedAdminPointsSystem to a JSON object
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
      obj.levels&.is_a?(Array) != false || raise("Passed value for field obj.levels is not the expected type, validation failed.")
      obj.boosts&.is_a?(Array) != false || raise("Passed value for field obj.boosts is not the expected type, validation failed.")
      obj.triggers&.is_a?(Array) != false || raise("Passed value for field obj.triggers is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.status.is_a?(TrophyApiClient::AdminPointsSystemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.badge.nil? || TrophyApiClient::AdminPointsSystemBadge.validate_raw(obj: obj.badge)
      obj.max_points&.is_a?(Integer) != false || raise("Passed value for field obj.max_points is not the expected type, validation failed.")
    end
  end
end
