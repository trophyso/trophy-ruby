# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # A user with their streak length in the rankings.
  class StreakRankingUser
    # @return [String] The ID of the user.
    attr_reader :user_id
    # @return [String] The name of the user. May be null if no name is set.
    attr_reader :name
    # @return [Integer] The user's streak length (active or longest depending on query parameter).
    attr_reader :streak_length
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user_id [String] The ID of the user.
    # @param name [String] The name of the user. May be null if no name is set.
    # @param streak_length [Integer] The user's streak length (active or longest depending on query parameter).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::StreakRankingUser]
    def initialize(user_id:, streak_length:, name: OMIT, additional_properties: nil)
      @user_id = user_id
      @name = name if name != OMIT
      @streak_length = streak_length
      @additional_properties = additional_properties
      @_field_set = { "userId": user_id, "name": name, "streakLength": streak_length }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of StreakRankingUser
    #
    # @param json_object [String]
    # @return [TrophyApiClient::StreakRankingUser]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      user_id = parsed_json["userId"]
      name = parsed_json["name"]
      streak_length = parsed_json["streakLength"]
      new(
        user_id: user_id,
        name: name,
        streak_length: streak_length,
        additional_properties: struct
      )
    end

    # Serialize an instance of StreakRankingUser to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.streak_length.is_a?(Integer) != false || raise("Passed value for field obj.streak_length is not the expected type, validation failed.")
    end
  end
end
