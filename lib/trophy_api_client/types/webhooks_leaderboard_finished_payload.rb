# frozen_string_literal: true

require_relative "leaderboard_response_with_rankings"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksLeaderboardFinishedPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [TrophyApiClient::LeaderboardResponseWithRankings] The leaderboard run that finished and its final rankings.
    attr_reader :leaderboard
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param leaderboard [TrophyApiClient::LeaderboardResponseWithRankings] The leaderboard run that finished and its final rankings.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksLeaderboardFinishedPayload]
    def initialize(type:, leaderboard:, additional_properties: nil)
      @type = type
      @leaderboard = leaderboard
      @additional_properties = additional_properties
      @_field_set = { "type": type, "leaderboard": leaderboard }
    end

    # Deserialize a JSON object to an instance of WebhooksLeaderboardFinishedPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksLeaderboardFinishedPayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      if parsed_json["leaderboard"].nil?
        leaderboard = nil
      else
        leaderboard = parsed_json["leaderboard"].to_json
        leaderboard = TrophyApiClient::LeaderboardResponseWithRankings.from_json(json_object: leaderboard)
      end
      new(
        type: type,
        leaderboard: leaderboard,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksLeaderboardFinishedPayload to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      TrophyApiClient::LeaderboardResponseWithRankings.validate_raw(obj: obj.leaderboard)
    end
  end
end
