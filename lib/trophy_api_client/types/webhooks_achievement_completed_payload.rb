# frozen_string_literal: true

require_relative "user"
require_relative "user_achievement_response"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksAchievementCompletedPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [TrophyApiClient::User] The user who completed the achievement.
    attr_reader :user
    # @return [TrophyApiClient::UserAchievementResponse] The achievement completion that occurred.
    attr_reader :achievement
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param user [TrophyApiClient::User] The user who completed the achievement.
    # @param achievement [TrophyApiClient::UserAchievementResponse] The achievement completion that occurred.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksAchievementCompletedPayload]
    def initialize(type:, user:, achievement:, additional_properties: nil)
      @type = type
      @user = user
      @achievement = achievement
      @additional_properties = additional_properties
      @_field_set = { "type": type, "user": user, "achievement": achievement }
    end

    # Deserialize a JSON object to an instance of WebhooksAchievementCompletedPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksAchievementCompletedPayload]
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
      if parsed_json["achievement"].nil?
        achievement = nil
      else
        achievement = parsed_json["achievement"].to_json
        achievement = TrophyApiClient::UserAchievementResponse.from_json(json_object: achievement)
      end
      new(
        type: type,
        user: user,
        achievement: achievement,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksAchievementCompletedPayload to a JSON object
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
      TrophyApiClient::UserAchievementResponse.validate_raw(obj: obj.achievement)
    end
  end
end
