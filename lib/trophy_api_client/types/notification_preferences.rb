# frozen_string_literal: true

require_relative "notification_channel"
require "ostruct"
require "json"

module TrophyApiClient
  # Notification preferences for each notification type.
  class NotificationPreferences
    # @return [Array<TrophyApiClient::NotificationChannel>] Channels to receive achievement completion notifications on.
    attr_reader :achievement_completed
    # @return [Array<TrophyApiClient::NotificationChannel>] Channels to receive recap notifications on.
    attr_reader :recap
    # @return [Array<TrophyApiClient::NotificationChannel>] Channels to receive reactivation notifications on.
    attr_reader :reactivation
    # @return [Array<TrophyApiClient::NotificationChannel>] Channels to receive streak reminder notifications on.
    attr_reader :streak_reminder
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param achievement_completed [Array<TrophyApiClient::NotificationChannel>] Channels to receive achievement completion notifications on.
    # @param recap [Array<TrophyApiClient::NotificationChannel>] Channels to receive recap notifications on.
    # @param reactivation [Array<TrophyApiClient::NotificationChannel>] Channels to receive reactivation notifications on.
    # @param streak_reminder [Array<TrophyApiClient::NotificationChannel>] Channels to receive streak reminder notifications on.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::NotificationPreferences]
    def initialize(achievement_completed: OMIT, recap: OMIT, reactivation: OMIT, streak_reminder: OMIT,
                   additional_properties: nil)
      @achievement_completed = achievement_completed if achievement_completed != OMIT
      @recap = recap if recap != OMIT
      @reactivation = reactivation if reactivation != OMIT
      @streak_reminder = streak_reminder if streak_reminder != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "achievement_completed": achievement_completed,
        "recap": recap,
        "reactivation": reactivation,
        "streak_reminder": streak_reminder
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of NotificationPreferences
    #
    # @param json_object [String]
    # @return [TrophyApiClient::NotificationPreferences]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      achievement_completed = parsed_json["achievement_completed"]
      recap = parsed_json["recap"]
      reactivation = parsed_json["reactivation"]
      streak_reminder = parsed_json["streak_reminder"]
      new(
        achievement_completed: achievement_completed,
        recap: recap,
        reactivation: reactivation,
        streak_reminder: streak_reminder,
        additional_properties: struct
      )
    end

    # Serialize an instance of NotificationPreferences to a JSON object
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
      obj.achievement_completed&.is_a?(Array) != false || raise("Passed value for field obj.achievement_completed is not the expected type, validation failed.")
      obj.recap&.is_a?(Array) != false || raise("Passed value for field obj.recap is not the expected type, validation failed.")
      obj.reactivation&.is_a?(Array) != false || raise("Passed value for field obj.reactivation is not the expected type, validation failed.")
      obj.streak_reminder&.is_a?(Array) != false || raise("Passed value for field obj.streak_reminder is not the expected type, validation failed.")
    end
  end
end
