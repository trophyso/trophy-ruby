# frozen_string_literal: true

require_relative "points_boost_status"
require_relative "points_boost_rounding"
require "ostruct"
require "json"

module TrophyApiClient
  class PointsBoost
    # @return [String] The ID of the points boost
    attr_reader :id
    # @return [String] The name of the points boost
    attr_reader :name
    # @return [TrophyApiClient::PointsBoostStatus] The status of the points boost
    attr_reader :status
    # @return [String] The start date of the points boost
    attr_reader :start
    # @return [String] The end date of the points boost
    attr_reader :end_
    # @return [Float] The multiplier of the points boost
    attr_reader :multiplier
    # @return [TrophyApiClient::PointsBoostRounding] The rounding method of the points boost
    attr_reader :rounding
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the points boost
    # @param name [String] The name of the points boost
    # @param status [TrophyApiClient::PointsBoostStatus] The status of the points boost
    # @param start [String] The start date of the points boost
    # @param end_ [String] The end date of the points boost
    # @param multiplier [Float] The multiplier of the points boost
    # @param rounding [TrophyApiClient::PointsBoostRounding] The rounding method of the points boost
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsBoost]
    def initialize(id:, name:, status:, start:, multiplier:, rounding:, end_: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @status = status
      @start = start
      @end_ = end_ if end_ != OMIT
      @multiplier = multiplier
      @rounding = rounding
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "status": status,
        "start": start,
        "end": end_,
        "multiplier": multiplier,
        "rounding": rounding
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PointsBoost
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsBoost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      status = parsed_json["status"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      multiplier = parsed_json["multiplier"]
      rounding = parsed_json["rounding"]
      new(
        id: id,
        name: name,
        status: status,
        start: start,
        end_: end_,
        multiplier: multiplier,
        rounding: rounding,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsBoost to a JSON object
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
      obj.status.is_a?(TrophyApiClient::PointsBoostStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.start.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.multiplier.is_a?(Float) != false || raise("Passed value for field obj.multiplier is not the expected type, validation failed.")
      obj.rounding.is_a?(TrophyApiClient::PointsBoostRounding) != false || raise("Passed value for field obj.rounding is not the expected type, validation failed.")
    end
  end
end
