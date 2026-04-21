# frozen_string_literal: true

require_relative "created_metric"
require_relative "admin_issue"
require "ostruct"
require "json"

module TrophyApiClient
  # Response containing updated metrics and any per-item issues identified by metric
  #  ID.
  class UpdateMetricsResponse
    # @return [Array<TrophyApiClient::CreatedMetric>] Array of successfully updated metrics.
    attr_reader :updated
    # @return [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during metric update.
    attr_reader :issues
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param updated [Array<TrophyApiClient::CreatedMetric>] Array of successfully updated metrics.
    # @param issues [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during metric update.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::UpdateMetricsResponse]
    def initialize(updated:, issues:, additional_properties: nil)
      @updated = updated
      @issues = issues
      @additional_properties = additional_properties
      @_field_set = { "updated": updated, "issues": issues }
    end

    # Deserialize a JSON object to an instance of UpdateMetricsResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::UpdateMetricsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      updated = parsed_json["updated"]&.map do |item|
        item = item.to_json
        TrophyApiClient::CreatedMetric.from_json(json_object: item)
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

    # Serialize an instance of UpdateMetricsResponse to a JSON object
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
