# frozen_string_literal: true

require_relative "user"
require_relative "webhook_user_leaderboard_response"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksLeaderboardRankChangedPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [TrophyApiClient::User] The user whose rank changed.
    attr_reader :user
    # @return [TrophyApiClient::WebhookUserLeaderboardResponse] The user's leaderboard data that changed.
    attr_reader :leaderboard
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param user [TrophyApiClient::User] The user whose rank changed.
    # @param leaderboard [TrophyApiClient::WebhookUserLeaderboardResponse] The user's leaderboard data that changed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksLeaderboardRankChangedPayload]
    def initialize(type:, user:, leaderboard:, additional_properties: nil)
      @type = type
      @user = user
      @leaderboard = leaderboard
      @additional_properties = additional_properties
      @_field_set = { "type": type, "user": user, "leaderboard": leaderboard }
    end

    # Deserialize a JSON object to an instance of
    #  WebhooksLeaderboardRankChangedPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksLeaderboardRankChangedPayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      if parsed_json["user"].nil?
        user = nil
      else
        user = parsed_json["user"].to_json
        user = TrophyApiClient::User.from_json(json_object: user)
      end
      if parsed_json["leaderboard"].nil?
        leaderboard = nil
      else
        leaderboard = parsed_json["leaderboard"].to_json
        leaderboard = TrophyApiClient::WebhookUserLeaderboardResponse.from_json(json_object: leaderboard)
      end
      new(
        type: type,
        user: user,
        leaderboard: leaderboard,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksLeaderboardRankChangedPayload to a JSON object
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
      TrophyApiClient::User.validate_raw(obj: obj.user)
      TrophyApiClient::WebhookUserLeaderboardResponse.validate_raw(obj: obj.leaderboard)
    end
  end
end
