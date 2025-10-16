# frozen_string_literal: true

require_relative "user"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksStreakFreezeEarnedPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [TrophyApiClient::User] The user who earned streak freezes.
    attr_reader :user
    # @return [Integer] The number of freezes earned.
    attr_reader :earned
    # @return [Integer] The total number of freezes the user has after the event.
    attr_reader :freezes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param user [TrophyApiClient::User] The user who earned streak freezes.
    # @param earned [Integer] The number of freezes earned.
    # @param freezes [Integer] The total number of freezes the user has after the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksStreakFreezeEarnedPayload]
    def initialize(type:, user:, earned:, freezes:, additional_properties: nil)
      @type = type
      @user = user
      @earned = earned
      @freezes = freezes
      @additional_properties = additional_properties
      @_field_set = { "type": type, "user": user, "earned": earned, "freezes": freezes }
    end

    # Deserialize a JSON object to an instance of WebhooksStreakFreezeEarnedPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksStreakFreezeEarnedPayload]
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
      earned = parsed_json["earned"]
      freezes = parsed_json["freezes"]
      new(
        type: type,
        user: user,
        earned: earned,
        freezes: freezes,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksStreakFreezeEarnedPayload to a JSON object
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
      obj.earned.is_a?(Integer) != false || raise("Passed value for field obj.earned is not the expected type, validation failed.")
      obj.freezes.is_a?(Integer) != false || raise("Passed value for field obj.freezes is not the expected type, validation failed.")
    end
  end
end
