# frozen_string_literal: true

require_relative "admin_points_boost_status"
require_relative "admin_points_boost_rounding"
require_relative "admin_points_boost_user_attributes_item"
require "ostruct"
require "json"

module TrophyApiClient
  # A points boost as returned from admin endpoints.
  class AdminPointsBoost
    # @return [String] The UUID of the boost.
    attr_reader :id
    # @return [String] The name of the boost.
    attr_reader :name
    # @return [TrophyApiClient::AdminPointsBoostStatus] The status of the boost.
    attr_reader :status
    # @return [String] The start date (YYYY-MM-DD).
    attr_reader :start
    # @return [String] The end date (YYYY-MM-DD) or null if no end date.
    attr_reader :end_
    # @return [Float] The points multiplier.
    attr_reader :multiplier
    # @return [TrophyApiClient::AdminPointsBoostRounding] How boosted points are rounded.
    attr_reader :rounding
    # @return [String] The customer ID of the user the boost was created for, or null for
    #  global/attribute-filtered boosts.
    attr_reader :user_id
    # @return [Array<TrophyApiClient::AdminPointsBoostUserAttributesItem>] User attribute filters applied to the boost. Only present for non-user-specific
    #  boosts (i.e. when `userId` is null). Empty array if no filters are set.
    attr_reader :user_attributes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the boost.
    # @param name [String] The name of the boost.
    # @param status [TrophyApiClient::AdminPointsBoostStatus] The status of the boost.
    # @param start [String] The start date (YYYY-MM-DD).
    # @param end_ [String] The end date (YYYY-MM-DD) or null if no end date.
    # @param multiplier [Float] The points multiplier.
    # @param rounding [TrophyApiClient::AdminPointsBoostRounding] How boosted points are rounded.
    # @param user_id [String] The customer ID of the user the boost was created for, or null for
    #  global/attribute-filtered boosts.
    # @param user_attributes [Array<TrophyApiClient::AdminPointsBoostUserAttributesItem>] User attribute filters applied to the boost. Only present for non-user-specific
    #  boosts (i.e. when `userId` is null). Empty array if no filters are set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminPointsBoost]
    def initialize(id:, name:, status:, start:, multiplier:, rounding:, end_: OMIT, user_id: OMIT,
                   user_attributes: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @status = status
      @start = start
      @end_ = end_ if end_ != OMIT
      @multiplier = multiplier
      @rounding = rounding
      @user_id = user_id if user_id != OMIT
      @user_attributes = user_attributes if user_attributes != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "name": name,
        "status": status,
        "start": start,
        "end": end_,
        "multiplier": multiplier,
        "rounding": rounding,
        "userId": user_id,
        "userAttributes": user_attributes
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AdminPointsBoost
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminPointsBoost]
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
      user_attributes = parsed_json["userAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsBoostUserAttributesItem.from_json(json_object: item)
      end
      new(
        id: id,
        name: name,
        status: status,
        start: start,
        end_: end_,
        multiplier: multiplier,
        rounding: rounding,
        user_id: user_id,
        user_attributes: user_attributes,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdminPointsBoost to a JSON object
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
      obj.status.is_a?(TrophyApiClient::AdminPointsBoostStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.start.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.multiplier.is_a?(Float) != false || raise("Passed value for field obj.multiplier is not the expected type, validation failed.")
      obj.rounding.is_a?(TrophyApiClient::AdminPointsBoostRounding) != false || raise("Passed value for field obj.rounding is not the expected type, validation failed.")
      obj.user_id&.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
      obj.user_attributes&.is_a?(Array) != false || raise("Passed value for field obj.user_attributes is not the expected type, validation failed.")
    end
  end
end
