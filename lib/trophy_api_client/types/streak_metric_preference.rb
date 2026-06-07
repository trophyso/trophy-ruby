# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # Per-metric streak threshold override for a user.
  class StreakMetricPreference
    # @return [String] The metric key.
    attr_reader :key
    # @return [Float] Minimum metric change in a streak period to count toward the streak.
    attr_reader :threshold
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The metric key.
    # @param threshold [Float] Minimum metric change in a streak period to count toward the streak.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::StreakMetricPreference]
    def initialize(key:, threshold:, additional_properties: nil)
      @key = key
      @threshold = threshold
      @additional_properties = additional_properties
      @_field_set = { "key": key, "threshold": threshold }
    end

    # Deserialize a JSON object to an instance of StreakMetricPreference
    #
    # @param json_object [String]
    # @return [TrophyApiClient::StreakMetricPreference]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      threshold = parsed_json["threshold"]
      new(
        key: key,
        threshold: threshold,
        additional_properties: struct
      )
    end

    # Serialize an instance of StreakMetricPreference to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.threshold.is_a?(Float) != false || raise("Passed value for field obj.threshold is not the expected type, validation failed.")
    end
  end
end
