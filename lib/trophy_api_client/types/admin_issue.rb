# frozen_string_literal: true

require_relative "admin_issue_severity"
require "ostruct"
require "json"

module TrophyApiClient
  # An issue encountered while processing an item in an admin API request.
  class AdminIssue
    # @return [String] The ID of the user the issue relates to, when applicable.
    attr_reader :user_id
    # @return [String] The ID of the points boost the issue relates to, when applicable.
    attr_reader :boost_id
    # @return [Integer] The zero-based index of the item the issue relates to, when no resource ID
    #  exists yet.
    attr_reader :index
    # @return [TrophyApiClient::AdminIssueSeverity] The severity level of the issue.
    attr_reader :severity
    # @return [String] A human-readable description of the issue.
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user_id [String] The ID of the user the issue relates to, when applicable.
    # @param boost_id [String] The ID of the points boost the issue relates to, when applicable.
    # @param index [Integer] The zero-based index of the item the issue relates to, when no resource ID
    #  exists yet.
    # @param severity [TrophyApiClient::AdminIssueSeverity] The severity level of the issue.
    # @param message [String] A human-readable description of the issue.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminIssue]
    def initialize(severity:, message:, user_id: OMIT, boost_id: OMIT, index: OMIT, additional_properties: nil)
      @user_id = user_id if user_id != OMIT
      @boost_id = boost_id if boost_id != OMIT
      @index = index if index != OMIT
      @severity = severity
      @message = message
      @additional_properties = additional_properties
      @_field_set = {
        "userId": user_id,
        "boostId": boost_id,
        "index": index,
        "severity": severity,
        "message": message
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AdminIssue
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminIssue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      user_id = parsed_json["userId"]
      boost_id = parsed_json["boostId"]
      index = parsed_json["index"]
      severity = parsed_json["severity"]
      message = parsed_json["message"]
      new(
        user_id: user_id,
        boost_id: boost_id,
        index: index,
        severity: severity,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdminIssue to a JSON object
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
      obj.user_id&.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
      obj.boost_id&.is_a?(String) != false || raise("Passed value for field obj.boost_id is not the expected type, validation failed.")
      obj.index&.is_a?(Integer) != false || raise("Passed value for field obj.index is not the expected type, validation failed.")
      obj.severity.is_a?(TrophyApiClient::AdminIssueSeverity) != false || raise("Passed value for field obj.severity is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
    end
  end
end
