# frozen_string_literal: true

require_relative "deleted_resource"
require_relative "admin_issue"
require "ostruct"
require "json"

module TrophyApiClient
  # Response containing deleted attributes represented by ID and any per-item
  #  issues, including invalid or missing attribute IDs.
  class DeleteAttributesResponse
    # @return [Array<TrophyApiClient::DeletedResource>] Array of deleted attributes represented by ID.
    attr_reader :deleted
    # @return [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during attribute deletion.
    attr_reader :issues
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param deleted [Array<TrophyApiClient::DeletedResource>] Array of deleted attributes represented by ID.
    # @param issues [Array<TrophyApiClient::AdminIssue>] Array of issues encountered during attribute deletion.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::DeleteAttributesResponse]
    def initialize(deleted:, issues:, additional_properties: nil)
      @deleted = deleted
      @issues = issues
      @additional_properties = additional_properties
      @_field_set = { "deleted": deleted, "issues": issues }
    end

    # Deserialize a JSON object to an instance of DeleteAttributesResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::DeleteAttributesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      deleted = parsed_json["deleted"]&.map do |item|
        item = item.to_json
        TrophyApiClient::DeletedResource.from_json(json_object: item)
      end
      issues = parsed_json["issues"]&.map do |item|
        item = item.to_json
        TrophyApiClient::AdminIssue.from_json(json_object: item)
      end
      new(
        deleted: deleted,
        issues: issues,
        additional_properties: struct
      )
    end

    # Serialize an instance of DeleteAttributesResponse to a JSON object
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
      obj.deleted.is_a?(Array) != false || raise("Passed value for field obj.deleted is not the expected type, validation failed.")
      obj.issues.is_a?(Array) != false || raise("Passed value for field obj.issues is not the expected type, validation failed.")
    end
  end
end
