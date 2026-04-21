# frozen_string_literal: true

require_relative "create_attribute_request_item_type"
require "ostruct"
require "json"

module TrophyApiClient
  # An attribute to create.
  class CreateAttributeRequestItem
    # @return [String] The attribute name.
    attr_reader :name
    # @return [String] The attribute key. Only alphanumeric characters, hyphens, and underscores are
    #  permitted.
    attr_reader :key
    # @return [TrophyApiClient::CreateAttributeRequestItemType] The attribute type.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The attribute name.
    # @param key [String] The attribute key. Only alphanumeric characters, hyphens, and underscores are
    #  permitted.
    # @param type [TrophyApiClient::CreateAttributeRequestItemType] The attribute type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreateAttributeRequestItem]
    def initialize(name:, key:, type:, additional_properties: nil)
      @name = name
      @key = key
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "name": name, "key": key, "type": type }
    end

    # Deserialize a JSON object to an instance of CreateAttributeRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreateAttributeRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      key = parsed_json["key"]
      type = parsed_json["type"]
      new(
        name: name,
        key: key,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateAttributeRequestItem to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.type.is_a?(TrophyApiClient::CreateAttributeRequestItemType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
