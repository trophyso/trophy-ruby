# frozen_string_literal: true

require_relative "points_award"
require "ostruct"
require "json"

module TrophyApiClient
  class GetUserPointsResponse
    # @return [String] The ID of the points system
    attr_reader :id
    # @return [String] The key of the points system
    attr_reader :key
    # @return [String] The name of the points system
    attr_reader :name
    # @return [String] The description of the points system
    attr_reader :description
    # @return [String] The URL of the badge image for the points system
    attr_reader :badge_url
    # @return [Float] The maximum number of points a user can be awarded in this points system
    attr_reader :max_points
    # @return [Integer] The user's total points
    attr_reader :total
    # @return [Array<TrophyApiClient::PointsAward>] Array of trigger awards that added points.
    attr_reader :awards
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the points system
    # @param key [String] The key of the points system
    # @param name [String] The name of the points system
    # @param description [String] The description of the points system
    # @param badge_url [String] The URL of the badge image for the points system
    # @param max_points [Float] The maximum number of points a user can be awarded in this points system
    # @param total [Integer] The user's total points
    # @param awards [Array<TrophyApiClient::PointsAward>] Array of trigger awards that added points.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::GetUserPointsResponse]
    def initialize(id:, key:, name:, total:, awards:, description: OMIT, badge_url: OMIT, max_points: OMIT,
                   additional_properties: nil)
      @id = id
      @key = key
      @name = name
      @description = description if description != OMIT
      @badge_url = badge_url if badge_url != OMIT
      @max_points = max_points if max_points != OMIT
      @total = total
      @awards = awards
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "badgeUrl": badge_url,
        "maxPoints": max_points,
        "total": total,
        "awards": awards
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GetUserPointsResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::GetUserPointsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      key = parsed_json["key"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      badge_url = parsed_json["badgeUrl"]
      max_points = parsed_json["maxPoints"]
      total = parsed_json["total"]
      awards = parsed_json["awards"]&.map do |item|
        item = item.to_json
        TrophyApiClient::PointsAward.from_json(json_object: item)
      end
      new(
        id: id,
        key: key,
        name: name,
        description: description,
        badge_url: badge_url,
        max_points: max_points,
        total: total,
        awards: awards,
        additional_properties: struct
      )
    end

    # Serialize an instance of GetUserPointsResponse to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.badge_url&.is_a?(String) != false || raise("Passed value for field obj.badge_url is not the expected type, validation failed.")
      obj.max_points&.is_a?(Float) != false || raise("Passed value for field obj.max_points is not the expected type, validation failed.")
      obj.total.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.awards.is_a?(Array) != false || raise("Passed value for field obj.awards is not the expected type, validation failed.")
    end
  end
end
