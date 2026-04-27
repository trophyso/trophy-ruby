# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  class AdminPointsTriggerUserAttributesItem
    # @return [String]
    attr_reader :attribute_id
    # @return [String]
    attr_reader :attribute_value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param attribute_id [String]
    # @param attribute_value [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminPointsTriggerUserAttributesItem]
    def initialize(attribute_id:, attribute_value:, additional_properties: nil)
      @attribute_id = attribute_id
      @attribute_value = attribute_value
      @additional_properties = additional_properties
      @_field_set = { "attributeId": attribute_id, "attributeValue": attribute_value }
    end

    # Deserialize a JSON object to an instance of AdminPointsTriggerUserAttributesItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminPointsTriggerUserAttributesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      attribute_id = parsed_json["attributeId"]
      attribute_value = parsed_json["attributeValue"]
      new(
        attribute_id: attribute_id,
        attribute_value: attribute_value,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdminPointsTriggerUserAttributesItem to a JSON object
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
      obj.attribute_id.is_a?(String) != false || raise("Passed value for field obj.attribute_id is not the expected type, validation failed.")
      obj.attribute_value.is_a?(String) != false || raise("Passed value for field obj.attribute_value is not the expected type, validation failed.")
    end
  end
end
