# frozen_string_literal: true

require "date"
require_relative "points_boost_webhook_payload"
require "ostruct"
require "json"

module TrophyApiClient
  class WebhooksPointsBoostStartedPayload
    # @return [String] The webhook event type.
    attr_reader :type
    # @return [DateTime] When the event occurred (ISO 8601).
    attr_reader :timestamp
    # @return [TrophyApiClient::PointsBoostWebhookPayload] The points boost that started.
    attr_reader :boost
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The webhook event type.
    # @param timestamp [DateTime] When the event occurred (ISO 8601).
    # @param boost [TrophyApiClient::PointsBoostWebhookPayload] The points boost that started.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WebhooksPointsBoostStartedPayload]
    def initialize(type:, timestamp:, boost:, additional_properties: nil)
      @type = type
      @timestamp = timestamp
      @boost = boost
      @additional_properties = additional_properties
      @_field_set = { "type": type, "timestamp": timestamp, "boost": boost }
    end

    # Deserialize a JSON object to an instance of WebhooksPointsBoostStartedPayload
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WebhooksPointsBoostStartedPayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      timestamp = (DateTime.parse(parsed_json["timestamp"]) unless parsed_json["timestamp"].nil?)
      if parsed_json["boost"].nil?
        boost = nil
      else
        boost = parsed_json["boost"].to_json
        boost = TrophyApiClient::PointsBoostWebhookPayload.from_json(json_object: boost)
      end
      new(
        type: type,
        timestamp: timestamp,
        boost: boost,
        additional_properties: struct
      )
    end

    # Serialize an instance of WebhooksPointsBoostStartedPayload to a JSON object
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
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      TrophyApiClient::PointsBoostWebhookPayload.validate_raw(obj: obj.boost)
    end
  end
end
