# frozen_string_literal: true

require_relative "bulk_insert_issue"
require "ostruct"
require "json"

module TrophyApiClient
  # Response containing any issues encountered while creating streak freezes.
  class CreateStreakFreezesResponse
    # @return [Array<TrophyApiClient::BulkInsertIssue>] Array of issues encountered during freeze creation.
    attr_reader :issues
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param issues [Array<TrophyApiClient::BulkInsertIssue>] Array of issues encountered during freeze creation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreateStreakFreezesResponse]
    def initialize(issues:, additional_properties: nil)
      @issues = issues
      @additional_properties = additional_properties
      @_field_set = { "issues": issues }
    end

    # Deserialize a JSON object to an instance of CreateStreakFreezesResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreateStreakFreezesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      issues = parsed_json["issues"]&.map do |item|
        item = item.to_json
        TrophyApiClient::BulkInsertIssue.from_json(json_object: item)
      end
      new(issues: issues, additional_properties: struct)
    end

    # Serialize an instance of CreateStreakFreezesResponse to a JSON object
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
      obj.issues.is_a?(Array) != false || raise("Passed value for field obj.issues is not the expected type, validation failed.")
    end
  end
end
