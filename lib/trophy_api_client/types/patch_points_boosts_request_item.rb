# frozen_string_literal: true

require_relative "patch_points_boosts_request_item_rounding"
require_relative "patch_points_boosts_request_item_user_attributes_item"
require "ostruct"
require "json"

module TrophyApiClient
  class PatchPointsBoostsRequestItem
    # @return [String] The UUID of the boost to update.
    attr_reader :id
    # @return [String] Updated name for the boost.
    attr_reader :name
    # @return [String] Updated start date (YYYY-MM-DD).
    attr_reader :start
    # @return [String] Updated end date (YYYY-MM-DD) or null to remove end date.
    attr_reader :end_
    # @return [Float] Updated points multiplier.
    attr_reader :multiplier
    # @return [TrophyApiClient::PatchPointsBoostsRequestItemRounding] Updated rounding strategy.
    attr_reader :rounding
    # @return [Array<TrophyApiClient::PatchPointsBoostsRequestItemUserAttributesItem>] Updated user attribute filters. Cannot be set on user-specific boosts. Set to
    #  null to clear.
    attr_reader :user_attributes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the boost to update.
    # @param name [String] Updated name for the boost.
    # @param start [String] Updated start date (YYYY-MM-DD).
    # @param end_ [String] Updated end date (YYYY-MM-DD) or null to remove end date.
    # @param multiplier [Float] Updated points multiplier.
    # @param rounding [TrophyApiClient::PatchPointsBoostsRequestItemRounding] Updated rounding strategy.
    # @param user_attributes [Array<TrophyApiClient::PatchPointsBoostsRequestItemUserAttributesItem>] Updated user attribute filters. Cannot be set on user-specific boosts. Set to
    #  null to clear.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PatchPointsBoostsRequestItem]
    def initialize(id:, name: OMIT, start: OMIT, end_: OMIT, multiplier: OMIT, rounding: OMIT, user_attributes: OMIT,
                   additional_properties: nil)
      @id = id
      @name = name if name != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @multiplier = multiplier if multiplier != OMIT
      @rounding = rounding if rounding != OMIT
      @user_attributes = user_attributes if user_attributes != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
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

    # Deserialize a JSON object to an instance of PatchPointsBoostsRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PatchPointsBoostsRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      start = parsed_json["start"]
      end_ = parsed_json["end"]
      multiplier = parsed_json["multiplier"]
      rounding = parsed_json["rounding"]
      user_attributes = parsed_json["userAttributes"]&.map do |item|
        item = item.to_json
        TrophyApiClient::PatchPointsBoostsRequestItemUserAttributesItem.from_json(json_object: item)
      end
      new(
        id: id,
        name: name,
        start: start,
        end_: end_,
        multiplier: multiplier,
        rounding: rounding,
        user_attributes: user_attributes,
        additional_properties: struct
      )
    end

    # Serialize an instance of PatchPointsBoostsRequestItem to a JSON object
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
      obj.start&.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(String) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.multiplier&.is_a?(Float) != false || raise("Passed value for field obj.multiplier is not the expected type, validation failed.")
      obj.rounding&.is_a?(TrophyApiClient::PatchPointsBoostsRequestItemRounding) != false || raise("Passed value for field obj.rounding is not the expected type, validation failed.")
      obj.user_attributes&.is_a?(Array) != false || raise("Passed value for field obj.user_attributes is not the expected type, validation failed.")
    end
  end
end
