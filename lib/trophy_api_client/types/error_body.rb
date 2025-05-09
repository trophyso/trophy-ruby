# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  class ErrorBody
    # @return [String]
    attr_reader :error
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param error [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::ErrorBody]
    def initialize(error:, additional_properties: nil)
      @error = error
      @additional_properties = additional_properties
      @_field_set = { "error": error }
    end

    # Deserialize a JSON object to an instance of ErrorBody
    #
    # @param json_object [String]
    # @return [TrophyApiClient::ErrorBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      error = parsed_json["error"]
      new(error: error, additional_properties: struct)
    end

    # Serialize an instance of ErrorBody to a JSON object
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
      obj.error.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end
