# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  class PointsTriggerResponseUserAttributesItem
    # @return [String] The key of the user attribute.
    attr_reader :key
    # @return [String] The value of the user attribute.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The key of the user attribute.
    # @param value [String] The value of the user attribute.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsTriggerResponseUserAttributesItem]
    def initialize(key:, value:, additional_properties: nil)
      @key = key
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "key": key, "value": value }
    end

    # Deserialize a JSON object to an instance of
    #  PointsTriggerResponseUserAttributesItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsTriggerResponseUserAttributesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      value = parsed_json["value"]
      new(
        key: key,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsTriggerResponseUserAttributesItem to a JSON
    #  object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
