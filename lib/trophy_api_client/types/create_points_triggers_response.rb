# frozen_string_literal: true

require_relative "admin_points_trigger"
require_relative "admin_issue"
require "ostruct"
require "json"

module TrophyApiClient
  # Response containing created triggers and any per-item issues.
  class CreatePointsTriggersResponse
    # @return [Array<TrophyApiClient::AdminPointsTrigger>] Array of successfully created triggers.
    attr_reader :created
    # @return [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during trigger creation.
    attr_reader :issues
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param created [Array<TrophyApiClient::AdminPointsTrigger>] Array of successfully created triggers.
    # @param issues [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during trigger creation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatePointsTriggersResponse]
    def initialize(created:, issues:, additional_properties: nil)
      @created = created
      @issues = issues
      @additional_properties = additional_properties
      @_field_set = { "created": created, "issues": issues }
    end

    # Deserialize a JSON object to an instance of CreatePointsTriggersResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatePointsTriggersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      created = parsed_json["created"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminPointsTrigger.from_json(json_object: item)
      end
      issues = parsed_json["issues"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminIssue.from_json(json_object: item)
      end
      new(
        created: created,
        issues: issues,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatePointsTriggersResponse to a JSON object
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
      obj.created.is_a?(Array) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.issues.is_a?(Array) != false || raise("Passed value for field obj.issues is not the expected type, validation failed.")
    end
  end
end
