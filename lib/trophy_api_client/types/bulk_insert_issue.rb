# frozen_string_literal: true

require_relative "bulk_insert_issue_level"
require "ostruct"
require "json"

module TrophyApiClient
  # An issue encountered while bulk inserting data.
  class BulkInsertIssue
    # @return [String] The ID of the user the issue relates to.
    attr_reader :user_id
    # @return [TrophyApiClient::BulkInsertIssueLevel] The severity level of the issue.
    attr_reader :level
    # @return [String] A human-readable description of the issue.
    attr_reader :reason
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user_id [String] The ID of the user the issue relates to.
    # @param level [TrophyApiClient::BulkInsertIssueLevel] The severity level of the issue.
    # @param reason [String] A human-readable description of the issue.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::BulkInsertIssue]
    def initialize(user_id:, level:, reason:, additional_properties: nil)
      @user_id = user_id
      @level = level
      @reason = reason
      @additional_properties = additional_properties
      @_field_set = { "userId": user_id, "level": level, "reason": reason }
    end

    # Deserialize a JSON object to an instance of BulkInsertIssue
    #
    # @param json_object [String]
    # @return [TrophyApiClient::BulkInsertIssue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      user_id = parsed_json["userId"]
      level = parsed_json["level"]
      reason = parsed_json["reason"]
      new(
        user_id: user_id,
        level: level,
        reason: reason,
        additional_properties: struct
      )
    end

    # Serialize an instance of BulkInsertIssue to a JSON object
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
      obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
      obj.level.is_a?(TrophyApiClient::BulkInsertIssueLevel) != false || raise("Passed value for field obj.level is not the expected type, validation failed.")
      obj.reason.is_a?(String) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
    end
  end
end
