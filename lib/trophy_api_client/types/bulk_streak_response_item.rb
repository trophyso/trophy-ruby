# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  class BulkStreakResponseItem
    # @return [String] The ID of the user.
    attr_reader :user_id
    # @return [Integer] The length of the user's streak.
    attr_reader :streak_length
    # @return [String] The timestamp the streak was extended, as a string.
    attr_reader :extended
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user_id [String] The ID of the user.
    # @param streak_length [Integer] The length of the user's streak.
    # @param extended [String] The timestamp the streak was extended, as a string.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::BulkStreakResponseItem]
    def initialize(user_id:, streak_length:, extended: OMIT, additional_properties: nil)
      @user_id = user_id
      @streak_length = streak_length
      @extended = extended if extended != OMIT
      @additional_properties = additional_properties
      @_field_set = { "userId": user_id, "streakLength": streak_length, "extended": extended }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of BulkStreakResponseItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::BulkStreakResponseItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      user_id = parsed_json["userId"]
      streak_length = parsed_json["streakLength"]
      extended = parsed_json["extended"]
      new(
        user_id: user_id,
        streak_length: streak_length,
        extended: extended,
        additional_properties: struct
      )
    end

    # Serialize an instance of BulkStreakResponseItem to a JSON object
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
      obj.streak_length.is_a?(Integer) != false || raise("Passed value for field obj.streak_length is not the expected type, validation failed.")
      obj.extended&.is_a?(String) != false || raise("Passed value for field obj.extended is not the expected type, validation failed.")
    end
  end
end
