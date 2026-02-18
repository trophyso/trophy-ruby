# frozen_string_literal: true

require_relative "created_points_boost_status"
require_relative "created_points_boost_rounding"
require "ostruct"
require "json"

module TrophyApiClient
  # A successfully created points boost returned from the create endpoint.
  class CreatedPointsBoost
    # @return [String] The UUID of the created boost.
    attr_reader :id
    # @return [String] The name of the boost.
    attr_reader :name
    # @return [TrophyApiClient::CreatedPointsBoostStatus] The status of the boost.
    attr_reader :status
    # @return [String] The start date (YYYY-MM-DD).
    attr_reader :start
    # @return [String] The end date (YYYY-MM-DD) or null if no end date.
    attr_reader :end_
    # @return [Float] The points multiplier.
    attr_reader :multiplier
    # @return [TrophyApiClient::CreatedPointsBoostRounding] How boosted points are rounded.
    attr_reader :rounding
    # @return [String] The customer ID of the user the boost was created for.
    attr_reader :user_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the created boost.
    # @param name [String] The name of the boost.
    # @param status [TrophyApiClient::CreatedPointsBoostStatus] The status of the boost.
    # @param start [String] The start date (YYYY-MM-DD).
    # @param end_ [String] The end date (YYYY-MM-DD) or null if no end date.
    # @param multiplier [Float] The points multiplier.
    # @param rounding [TrophyApiClient::CreatedPointsBoostRounding] How boosted points are rounded.
    # @param user_id [String] The customer ID of the user the boost was created for.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatedPointsBoost]
    def initialize(id:, name:, status:, start:, multiplier:, rounding:, user_id:, end_: OMIT,
                   additional_properties: nil)
      @id = id
      @name = name
      @status = status
      @start = start
      @end_ = end_ if end_ != OMIT
      @multiplier = multiplier
      @rounding = rounding
      @user_id = user_id
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "status": status,
        "start": start,
        "end": end_,
        "multiplier": multiplier,
        "rounding": rounding,
        "userId": user_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreatedPointsBoost
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatedPointsBoost]
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
      user_id = parsed_json["userId"]
      new(
        id: id,
        name: name,
        status: status,
        start: start,
        end_: end_,
        multiplier: multiplier,
        rounding: rounding,
        user_id: user_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatedPointsBoost to a JSON object
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
      obj.status.is_a?(TrophyApiClient::CreatedPointsBoostStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.start.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.multiplier.is_a?(Float) != false || raise("Passed value for field obj.multiplier is not the expected type, validation failed.")
      obj.rounding.is_a?(TrophyApiClient::CreatedPointsBoostRounding) != false || raise("Passed value for field obj.rounding is not the expected type, validation failed.")
      obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
    end
  end
end
