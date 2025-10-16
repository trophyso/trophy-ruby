# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  class PointsRange
    # @return [Integer] The start of the points range. Inclusive.
    attr_reader :from
    # @return [Integer] The end of the points range. Inclusive.
    attr_reader :to
    # @return [Integer] The number of users in this points range.
    attr_reader :users
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param from [Integer] The start of the points range. Inclusive.
    # @param to [Integer] The end of the points range. Inclusive.
    # @param users [Integer] The number of users in this points range.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::PointsRange]
    def initialize(from:, to:, users:, additional_properties: nil)
      @from = from
      @to = to
      @users = users
      @additional_properties = additional_properties
      @_field_set = { "from": from, "to": to, "users": users }
    end

    # Deserialize a JSON object to an instance of PointsRange
    #
    # @param json_object [String]
    # @return [TrophyApiClient::PointsRange]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      from = parsed_json["from"]
      to = parsed_json["to"]
      users = parsed_json["users"]
      new(
        from: from,
        to: to,
        users: users,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointsRange to a JSON object
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
      obj.from.is_a?(Integer) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
      obj.to.is_a?(Integer) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      obj.users.is_a?(Integer) != false || raise("Passed value for field obj.users is not the expected type, validation failed.")
    end
  end
end
