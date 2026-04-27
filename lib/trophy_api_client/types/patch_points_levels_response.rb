# frozen_string_literal: true

require_relative "admin_points_level"
require_relative "admin_issue"
require "ostruct"
require "json"

module TrophyApiClient
  # Response containing updated levels and any issues encountered.
  class PatchPointsLevelsResponse
    # @return [Array<TrophyApiClient::AdminPointsLevel>] Array of successfully updated levels.
    attr_reader :updated
    # @return [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during level updates.
    attr_reader :issues
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param updated [Array<TrophyApiClient::AdminPointsLevel>] Array of successfully updated levels.
    # @param issues [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during level updates.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PatchPointsLevelsResponse]
    def initialize(updated:, issues:, additional_properties: nil)
      @updated = updated
      @issues = issues
      @additional_properties = additional_properties
      @_field_set = { "updated": updated, "issues": issues }
    end

    # Deserialize a JSON object to an instance of PatchPointsLevelsResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PatchPointsLevelsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      updated = parsed_json["updated"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsLevel.from_json(json_object: item)
      end
      issues = parsed_json["issues"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminIssue.from_json(json_object: item)
      end
      new(
        updated: updated,
        issues: issues,
        additional_properties: struct
      )
    end

    # Serialize an instance of PatchPointsLevelsResponse to a JSON object
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
      obj.updated.is_a?(Array) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
      obj.issues.is_a?(Array) != false || raise("Passed value for field obj.issues is not the expected type, validation failed.")
    end
  end
end
