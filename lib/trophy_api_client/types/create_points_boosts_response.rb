# frozen_string_literal: true

require_relative "created_points_boost"
require_relative "bulk_insert_issue"
require "ostruct"
require "json"

module TrophyApiClient
  # Response containing created boosts and any issues encountered while creating
  #  points boosts.
  class CreatePointsBoostsResponse
    # @return [Array<TrophyApiClient::CreatedPointsBoost>] Array of successfully created boosts.
    attr_reader :created
    # @return [Array<TrophyApiClient::BulkInsertIssue>] Array of issues encountered during boost creation.
    attr_reader :issues
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param created [Array<TrophyApiClient::CreatedPointsBoost>] Array of successfully created boosts.
    # @param issues [Array<TrophyApiClient::BulkInsertIssue>] Array of issues encountered during boost creation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatePointsBoostsResponse]
    def initialize(created:, issues:, additional_properties: nil)
      @created = created
      @issues = issues
      @additional_properties = additional_properties
      @_field_set = { "created": created, "issues": issues }
    end

    # Deserialize a JSON object to an instance of CreatePointsBoostsResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatePointsBoostsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      created = parsed_json["created"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatedPointsBoost.from_json(json_object: item)
      end
      issues = parsed_json["issues"]&.map do |item|
        item = item.to_json
        TrophyApiClient::BulkInsertIssue.from_json(json_object: item)
      end
      new(
        created: created,
        issues: issues,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatePointsBoostsResponse to a JSON object
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
