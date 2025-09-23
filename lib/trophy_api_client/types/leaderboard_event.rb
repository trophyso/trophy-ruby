# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module TrophyApiClient
  # A leaderboard event representing a change in a user's rank or value.
  class LeaderboardEvent
    # @return [DateTime] The timestamp when the event occurred.
    attr_reader :timestamp
    # @return [Integer] The user's rank before this event, or null if they were not on the leaderboard.
    attr_reader :previous_rank
    # @return [Integer] The user's rank after this event, or null if they are no longer on the
    #  leaderboard.
    attr_reader :rank
    # @return [Integer] The user's value before this event, or null if they were not on the leaderboard.
    attr_reader :previous_value
    # @return [Integer] The user's value after this event, or null if they are no longer on the
    #  leaderboard.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timestamp [DateTime] The timestamp when the event occurred.
    # @param previous_rank [Integer] The user's rank before this event, or null if they were not on the leaderboard.
    # @param rank [Integer] The user's rank after this event, or null if they are no longer on the
    #  leaderboard.
    # @param previous_value [Integer] The user's value before this event, or null if they were not on the leaderboard.
    # @param value [Integer] The user's value after this event, or null if they are no longer on the
    #  leaderboard.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::LeaderboardEvent]
    def initialize(timestamp: OMIT, previous_rank: OMIT, rank: OMIT, previous_value: OMIT, value: OMIT,
                   additional_properties: nil)
      @timestamp = timestamp if timestamp != OMIT
      @previous_rank = previous_rank if previous_rank != OMIT
      @rank = rank if rank != OMIT
      @previous_value = previous_value if previous_value != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "timestamp": timestamp,
        "previousRank": previous_rank,
        "rank": rank,
        "previousValue": previous_value,
        "value": value
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LeaderboardEvent
    #
    # @param json_object [String]
    # @return [TrophyApiClient::LeaderboardEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timestamp = (DateTime.parse(parsed_json["timestamp"]) unless parsed_json["timestamp"].nil?)
      previous_rank = parsed_json["previousRank"]
      rank = parsed_json["rank"]
      previous_value = parsed_json["previousValue"]
      value = parsed_json["value"]
      new(
        timestamp: timestamp,
        previous_rank: previous_rank,
        rank: rank,
        previous_value: previous_value,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of LeaderboardEvent to a JSON object
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
      obj.timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.previous_rank&.is_a?(Integer) != false || raise("Passed value for field obj.previous_rank is not the expected type, validation failed.")
      obj.rank&.is_a?(Integer) != false || raise("Passed value for field obj.rank is not the expected type, validation failed.")
      obj.previous_value&.is_a?(Integer) != false || raise("Passed value for field obj.previous_value is not the expected type, validation failed.")
      obj.value&.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
