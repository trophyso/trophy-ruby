# frozen_string_literal: true

require_relative "achievement_response"
require "ostruct"
require "json"

module TrophyApiClient
  class AchievementCompletionResponse
    # @return [String] The unique ID of the completion.
    attr_reader :completion_id
    # @return [TrophyApiClient::AchievementResponse]
    attr_reader :achievement
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param completion_id [String] The unique ID of the completion.
    # @param achievement [TrophyApiClient::AchievementResponse]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AchievementCompletionResponse]
    def initialize(completion_id:, achievement:, additional_properties: nil)
      @completion_id = completion_id
      @achievement = achievement
      @additional_properties = additional_properties
      @_field_set = { "completionId": completion_id, "achievement": achievement }
    end

    # Deserialize a JSON object to an instance of AchievementCompletionResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AchievementCompletionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      completion_id = parsed_json["completionId"]
      if parsed_json["achievement"].nil?
        achievement = nil
      else
        achievement = parsed_json["achievement"].to_json
        achievement = TrophyApiClient::AchievementResponse.from_json(json_object: achievement)
      end
      new(
        completion_id: completion_id,
        achievement: achievement,
        additional_properties: struct
      )
    end

    # Serialize an instance of AchievementCompletionResponse to a JSON object
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
      obj.completion_id.is_a?(String) != false || raise("Passed value for field obj.completion_id is not the expected type, validation failed.")
      TrophyApiClient::AchievementResponse.validate_raw(obj: obj.achievement)
    end
  end
end
