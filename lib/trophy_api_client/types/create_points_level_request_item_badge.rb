# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # An optional badge for the level.
  class CreatePointsLevelRequestItemBadge
    # @return [String] The URL of the badge image.
    attr_reader :url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param url [String] The URL of the badge image.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatePointsLevelRequestItemBadge]
    def initialize(url:, additional_properties: nil)
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "url": url }
    end

    # Deserialize a JSON object to an instance of CreatePointsLevelRequestItemBadge
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatePointsLevelRequestItemBadge]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      url = parsed_json["url"]
      new(url: url, additional_properties: struct)
    end

    # Serialize an instance of CreatePointsLevelRequestItemBadge to a JSON object
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
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end
