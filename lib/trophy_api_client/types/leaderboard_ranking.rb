# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # A user's ranking in a leaderboard.
  class LeaderboardRanking
    # @return [String] The ID of the user.
    attr_reader :user_id
    # @return [String] The name of the user. May be null if no name is set.
    attr_reader :user_name
    # @return [Integer] The user's rank in the leaderboard.
    attr_reader :rank
    # @return [Integer] The user's value for this leaderboard (points, metric value, etc.).
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user_id [String] The ID of the user.
    # @param user_name [String] The name of the user. May be null if no name is set.
    # @param rank [Integer] The user's rank in the leaderboard.
    # @param value [Integer] The user's value for this leaderboard (points, metric value, etc.).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::LeaderboardRanking]
    def initialize(user_id:, rank:, value:, user_name: OMIT, additional_properties: nil)
      @user_id = user_id
      @user_name = user_name if user_name != OMIT
      @rank = rank
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "userId": user_id, "userName": user_name, "rank": rank, "value": value }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LeaderboardRanking
    #
    # @param json_object [String]
    # @return [TrophyApiClient::LeaderboardRanking]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      user_id = parsed_json["userId"]
      user_name = parsed_json["userName"]
      rank = parsed_json["rank"]
      value = parsed_json["value"]
      new(
        user_id: user_id,
        user_name: user_name,
        rank: rank,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of LeaderboardRanking to a JSON object
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
      obj.user_name&.is_a?(String) != false || raise("Passed value for field obj.user_name is not the expected type, validation failed.")
      obj.rank.is_a?(Integer) != false || raise("Passed value for field obj.rank is not the expected type, validation failed.")
      obj.value.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
