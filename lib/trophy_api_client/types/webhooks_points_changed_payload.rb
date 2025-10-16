# frozen_string_literal: true

require_relative "user"
require_relative "get_user_points_response"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksPointsChangedPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [TrophyApiClient::User] The user whose points increased or decreased.
    attr_reader :user
    # @return [TrophyApiClient::GetUserPointsResponse] The user's points after the event.
    attr_reader :points
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param user [TrophyApiClient::User] The user whose points increased or decreased.
    # @param points [TrophyApiClient::GetUserPointsResponse] The user's points after the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksPointsChangedPayload]
    def initialize(type:, user:, points:, additional_properties: nil)
      @type = type
      @user = user
      @points = points
      @additional_properties = additional_properties
      @_field_set = { "type": type, "user": user, "points": points }
    end

    # Deserialize a JSON object to an instance of WebhooksPointsChangedPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksPointsChangedPayload]
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
      if parsed_json["points"].nil?
        points = nil
      else
        points = parsed_json["points"].to_json
        points = TrophyApiClient::GetUserPointsResponse.from_json(json_object: points)
      end
      new(
        type: type,
        user: user,
        points: points,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksPointsChangedPayload to a JSON object
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
      TrophyApiClient::GetUserPointsResponse.validate_raw(obj: obj.points)
    end
  end
end
