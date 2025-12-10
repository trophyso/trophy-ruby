# frozen_string_literal: true

require_relative "user"
require_relative "wrapped_activity"
require "ostruct"
require "json"

module TrophyApiClient
  # A user's year-in-review wrapped data including activity summaries, metrics,
  #  points, achievements, streaks, and leaderboard rankings.
  class WrappedResponse
    # @return [TrophyApiClient::User] The user's profile information.
    attr_reader :user
    # @return [TrophyApiClient::WrappedActivity] The user's activity data for the wrapped year.
    attr_reader :activity
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user [TrophyApiClient::User] The user's profile information.
    # @param activity [TrophyApiClient::WrappedActivity] The user's activity data for the wrapped year.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WrappedResponse]
    def initialize(user:, activity:, additional_properties: nil)
      @user = user
      @activity = activity
      @additional_properties = additional_properties
      @_field_set = { "user": user, "activity": activity }
    end

    # Deserialize a JSON object to an instance of WrappedResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WrappedResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["user"].nil?
        user = nil
      else
        user = parsed_json["user"].to_json
        user = TrophyApiClient::User.from_json(json_object: user)
      end
      if parsed_json["activity"].nil?
        activity = nil
      else
        activity = parsed_json["activity"].to_json
        activity = TrophyApiClient::WrappedActivity.from_json(json_object: activity)
      end
      new(
        user: user,
        activity: activity,
        additional_properties: struct
      )
    end

    # Serialize an instance of WrappedResponse to a JSON object
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
      TrophyApiClient::User.validate_raw(obj: obj.user)
      TrophyApiClient::WrappedActivity.validate_raw(obj: obj.activity)
    end
  end
end
