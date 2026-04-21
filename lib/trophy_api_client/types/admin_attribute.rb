# frozen_string_literal: true

require_relative "admin_attribute_type"
require "ostruct"
require "json"

module TrophyApiClient
  # An attribute returned from the admin attributes endpoints.
  class AdminAttribute
    # @return [String] The UUID of the attribute.
    attr_reader :id
    # @return [String] The attribute name.
    attr_reader :name
    # @return [String] The attribute key.
    attr_reader :key
    # @return [TrophyApiClient::AdminAttributeType] The attribute type.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the attribute.
    # @param name [String] The attribute name.
    # @param key [String] The attribute key.
    # @param type [TrophyApiClient::AdminAttributeType] The attribute type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminAttribute]
    def initialize(id:, name:, key:, type:, additional_properties: nil)
      @id = id
      @name = name
      @key = key
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "key": key, "type": type }
    end

    # Deserialize a JSON object to an instance of AdminAttribute
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminAttribute]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      key = parsed_json["key"]
      type = parsed_json["type"]
      new(
        id: id,
        name: name,
        key: key,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdminAttribute to a JSON object
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
      obj.type.is_a?(TrophyApiClient::AdminAttributeType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
