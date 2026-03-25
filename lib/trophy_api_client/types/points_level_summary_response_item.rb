# frozen_string_literal: true

require_relative "points_level"
require "ostruct"
require "json"

module TrophyApiClient
  class PointsLevelSummaryResponseItem
    # @return [TrophyApiClient::PointsLevel]
    attr_reader :level
    # @return [Integer] The number of users currently at this level
    attr_reader :users
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param level [TrophyApiClient::PointsLevel]
    # @param users [Integer] The number of users currently at this level
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsLevelSummaryResponseItem]
    def initialize(level:, users:, additional_properties: nil)
      @level = level
      @users = users
      @additional_properties = additional_properties
      @_field_set = { "level": level, "users": users }
    end

    # Deserialize a JSON object to an instance of PointsLevelSummaryResponseItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsLevelSummaryResponseItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["level"].nil?
        level = nil
      else
        level = parsed_json["level"].to_json
        level = TrophyApiClient::PointsLevel.from_json(json_object: level)
      end
      users = parsed_json["users"]
      new(
        level: level,
        users: users,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsLevelSummaryResponseItem to a JSON object
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
      TrophyApiClient::PointsLevel.validate_raw(obj: obj.level)
      obj.users.is_a?(Integer) != false || raise("Passed value for field obj.users is not the expected type, validation failed.")
    end
  end
end
