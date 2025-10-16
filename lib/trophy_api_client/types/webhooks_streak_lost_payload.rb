# frozen_string_literal: true

require_relative "user"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksStreakLostPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [TrophyApiClient::User] The user who lost the streak.
    attr_reader :user
    # @return [Integer] The length of the streak that was lost.
    attr_reader :length
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param user [TrophyApiClient::User] The user who lost the streak.
    # @param length [Integer] The length of the streak that was lost.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksStreakLostPayload]
    def initialize(type:, user:, length:, additional_properties: nil)
      @type = type
      @user = user
      @length = length
      @additional_properties = additional_properties
      @_field_set = { "type": type, "user": user, "length": length }
    end

    # Deserialize a JSON object to an instance of WebhooksStreakLostPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksStreakLostPayload]
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
      length = parsed_json["length"]
      new(
        type: type,
        user: user,
        length: length,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksStreakLostPayload to a JSON object
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
      obj.length.is_a?(Integer) != false || raise("Passed value for field obj.length is not the expected type, validation failed.")
    end
  end
end
