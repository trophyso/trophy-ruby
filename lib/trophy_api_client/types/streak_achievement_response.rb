# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module TrophyApiClient
  class StreakAchievementResponse
    # @return [String] The trigger of the achievement, in this case always 'streak'.
    attr_reader :trigger
    # @return [Integer] The length of the streak required to complete the achievement.
    attr_reader :streak_length
    # @return [String] The unique ID of the achievement.
    attr_reader :id
    # @return [String] The name of this achievement.
    attr_reader :name
    # @return [String] The URL of the badge image for the achievement, if one has been uploaded.
    attr_reader :badge_url
    # @return [String] The key used to reference this achievement in the API.
    attr_reader :key
    # @return [DateTime] The date and time the achievement was completed, in ISO 8601 format.
    attr_reader :achieved_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param trigger [String] The trigger of the achievement, in this case always 'streak'.
    # @param streak_length [Integer] The length of the streak required to complete the achievement.
    # @param id [String] The unique ID of the achievement.
    # @param name [String] The name of this achievement.
    # @param badge_url [String] The URL of the badge image for the achievement, if one has been uploaded.
    # @param key [String] The key used to reference this achievement in the API.
    # @param achieved_at [DateTime] The date and time the achievement was completed, in ISO 8601 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::StreakAchievementResponse]
    def initialize(trigger:, streak_length:, id:, name:, badge_url: OMIT, key: OMIT, achieved_at: OMIT,
                   additional_properties: nil)
      @trigger = trigger
      @streak_length = streak_length
      @id = id
      @name = name
      @badge_url = badge_url if badge_url != OMIT
      @key = key if key != OMIT
      @achieved_at = achieved_at if achieved_at != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "trigger": trigger,
        "streakLength": streak_length,
        "id": id,
        "name": name,
        "badgeUrl": badge_url,
        "key": key,
        "achievedAt": achieved_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of StreakAchievementResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::StreakAchievementResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      trigger = parsed_json["trigger"]
      streak_length = parsed_json["streakLength"]
      id = parsed_json["id"]
      name = parsed_json["name"]
      badge_url = parsed_json["badgeUrl"]
      key = parsed_json["key"]
      achieved_at = (DateTime.parse(parsed_json["achievedAt"]) unless parsed_json["achievedAt"].nil?)
      new(
        trigger: trigger,
        streak_length: streak_length,
        id: id,
        name: name,
        badge_url: badge_url,
        key: key,
        achieved_at: achieved_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of StreakAchievementResponse to a JSON object
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
      obj.trigger.is_a?(String) != false || raise("Passed value for field obj.trigger is not the expected type, validation failed.")
      obj.streak_length.is_a?(Integer) != false || raise("Passed value for field obj.streak_length is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.badge_url&.is_a?(String) != false || raise("Passed value for field obj.badge_url is not the expected type, validation failed.")
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.achieved_at&.is_a?(DateTime) != false || raise("Passed value for field obj.achieved_at is not the expected type, validation failed.")
    end
  end
end
