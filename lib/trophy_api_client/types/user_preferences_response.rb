# frozen_string_literal: true

require_relative "notification_preferences"
require_relative "streak_preferences"
require "ostruct"
require "json"

module TrophyApiClient
  # A user's preferences.
  class UserPreferencesResponse
    # @return [TrophyApiClient::NotificationPreferences]
    attr_reader :notifications
    # @return [TrophyApiClient::StreakPreferences]
    attr_reader :streak
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param notifications [TrophyApiClient::NotificationPreferences]
    # @param streak [TrophyApiClient::StreakPreferences]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::UserPreferencesResponse]
    def initialize(notifications:, streak: OMIT, additional_properties: nil)
      @notifications = notifications
      @streak = streak if streak != OMIT
      @additional_properties = additional_properties
      @_field_set = { "notifications": notifications, "streak": streak }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UserPreferencesResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::UserPreferencesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["notifications"].nil?
        notifications = nil
      else
        notifications = parsed_json["notifications"].to_json
        notifications = TrophyApiClient::NotificationPreferences.from_json(json_object: notifications)
      end
      if parsed_json["streak"].nil?
        streak = nil
      else
        streak = parsed_json["streak"].to_json
        streak = TrophyApiClient::StreakPreferences.from_json(json_object: streak)
      end
      new(
        notifications: notifications,
        streak: streak,
        additional_properties: struct
      )
    end

    # Serialize an instance of UserPreferencesResponse to a JSON object
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
      TrophyApiClient::NotificationPreferences.validate_raw(obj: obj.notifications)
      obj.streak.nil? || TrophyApiClient::StreakPreferences.validate_raw(obj: obj.streak)
    end
  end
end
