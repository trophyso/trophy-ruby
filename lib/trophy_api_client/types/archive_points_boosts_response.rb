# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # Response containing the count of archived points boosts.
  class ArchivePointsBoostsResponse
    # @return [Integer] The number of boosts that were archived.
    attr_reader :archived_count
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param archived_count [Integer] The number of boosts that were archived.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::ArchivePointsBoostsResponse]
    def initialize(archived_count:, additional_properties: nil)
      @archived_count = archived_count
      @additional_properties = additional_properties
      @_field_set = { "archivedCount": archived_count }
    end

    # Deserialize a JSON object to an instance of ArchivePointsBoostsResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::ArchivePointsBoostsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      archived_count = parsed_json["archivedCount"]
      new(archived_count: archived_count, additional_properties: struct)
    end

    # Serialize an instance of ArchivePointsBoostsResponse to a JSON object
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
      obj.archived_count.is_a?(Integer) != false || raise("Passed value for field obj.archived_count is not the expected type, validation failed.")
    end
  end
end
