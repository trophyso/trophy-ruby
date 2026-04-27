# frozen_string_literal: true

require_relative "admin_points_system_status"
require_relative "admin_points_system_badge"
require "ostruct"
require "json"

module TrophyApiClient
  # A points system returned from the admin points systems endpoints.
  class AdminPointsSystem
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

    # @param id [String] The UUID of the points system.
    # @param name [String] The points system name.
    # @param key [String] The points system key.
    # @param description [String] The points system description.
    # @param status [TrophyApiClient::AdminPointsSystemStatus] The points system status.
    # @param badge [TrophyApiClient::AdminPointsSystemBadge] The badge for the points system.
    # @param max_points [Integer] The maximum points a user can earn.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminPointsSystem]
    def initialize(id:, name:, key:, description:, status:, badge: OMIT, max_points: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @key = key
      @description = description
      @status = status
      @badge = badge if badge != OMIT
      @max_points = max_points if max_points != OMIT
      @additional_properties = additional_properties
      @_field_set = {
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

    # Deserialize a JSON object to an instance of AdminPointsSystem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminPointsSystem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
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

    # Serialize an instance of AdminPointsSystem to a JSON object
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
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.status.is_a?(TrophyApiClient::AdminPointsSystemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.badge.nil? || TrophyApiClient::AdminPointsSystemBadge.validate_raw(obj: obj.badge)
      obj.max_points&.is_a?(Integer) != false || raise("Passed value for field obj.max_points is not the expected type, validation failed.")
    end
  end
end
