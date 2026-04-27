# frozen_string_literal: true

require_relative "create_points_boost_request_item_rounding"
require_relative "create_points_boost_request_item_user_attributes_item"
require "ostruct"
require "json"

module TrophyApiClient
  # A points boost to create. May optionally target a specific user via `userId` or
  #  filter by user attributes via `userAttributes`. These two fields are mutually
  #  exclusive.
  class CreatePointsBoostRequestItem
    # @return [String] The ID of the user to create a boost for. Mutually exclusive with
    #  `userAttributes` — providing `userAttributes` when `userId` is set will result
    #  in an error. Omit for a global boost.
    attr_reader :user_id
    # @return [String] The name of the boost.
    attr_reader :name
    # @return [String] The start date of the boost (YYYY-MM-DD).
    attr_reader :start
    # @return [String] The end date of the boost (YYYY-MM-DD). If null, the boost has no end date.
    attr_reader :end_
    # @return [Float] The points multiplier. Must be greater than 0, not equal to 1, and less than
    #  100.
    attr_reader :multiplier
    # @return [TrophyApiClient::CreatePointsBoostRequestItemRounding] How to round the boosted points. Defaults to 'down'.
    attr_reader :rounding
    # @return [Array<TrophyApiClient::CreatePointsBoostRequestItemUserAttributesItem>] User attribute filters for the boost. Cannot be provided when `userId` is set.
    attr_reader :user_attributes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user_id [String] The ID of the user to create a boost for. Mutually exclusive with
    #  `userAttributes` — providing `userAttributes` when `userId` is set will result
    #  in an error. Omit for a global boost.
    # @param name [String] The name of the boost.
    # @param start [String] The start date of the boost (YYYY-MM-DD).
    # @param end_ [String] The end date of the boost (YYYY-MM-DD). If null, the boost has no end date.
    # @param multiplier [Float] The points multiplier. Must be greater than 0, not equal to 1, and less than
    #  100.
    # @param rounding [TrophyApiClient::CreatePointsBoostRequestItemRounding] How to round the boosted points. Defaults to 'down'.
    # @param user_attributes [Array<TrophyApiClient::CreatePointsBoostRequestItemUserAttributesItem>] User attribute filters for the boost. Cannot be provided when `userId` is set.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatePointsBoostRequestItem]
    def initialize(name:, start:, multiplier:, user_id: OMIT, end_: OMIT, rounding: OMIT, user_attributes: OMIT,
                   additional_properties: nil)
      @user_id = user_id if user_id != OMIT
      @name = name
      @start = start
      @end_ = end_ if end_ != OMIT
      @multiplier = multiplier
      @rounding = rounding if rounding != OMIT
      @user_attributes = user_attributes if user_attributes != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "userId": user_id,
        "name": name,
        "start": start,
        "end": end_,
        "multiplier": multiplier,
        "rounding": rounding,
        "userAttributes": user_attributes
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreatePointsBoostRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatePointsBoostRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      user_id = parsed_json["userId"]
      name = parsed_json["name"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      multiplier = parsed_json["multiplier"]
      rounding = parsed_json["rounding"]
      user_attributes = parsed_json["userAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatePointsBoostRequestItemUserAttributesItem.from_json(json_object: item)
      end
      new(
        user_id: user_id,
        name: name,
        start: start,
        end_: end_,
        multiplier: multiplier,
        rounding: rounding,
        user_attributes: user_attributes,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatePointsBoostRequestItem to a JSON object
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
      obj.user_id&.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.start.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.multiplier.is_a?(Float) != false || raise("Passed value for field obj.multiplier is not the expected type, validation failed.")
      obj.rounding&.is_a?(TrophyApiClient::CreatePointsBoostRequestItemRounding) != false || raise("Passed value for field obj.rounding is not the expected type, validation failed.")
      obj.user_attributes&.is_a?(Array) != false || raise("Passed value for field obj.user_attributes is not the expected type, validation failed.")
    end
  end
end
