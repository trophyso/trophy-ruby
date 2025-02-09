# frozen_string_literal: true

require_relative "streak_frequency"
require "ostruct"
require "json"

module TrophyApiClient
  class StreakResponse
    # @return [Integer] The length of the user's current streak.
    attr_reader :length
    # @return [TrophyApiClient::StreakFrequency] The frequency of the streak.
    attr_reader :frequency
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param length [Integer] The length of the user's current streak.
    # @param frequency [TrophyApiClient::StreakFrequency] The frequency of the streak.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::StreakResponse]
    def initialize(length:, frequency:, additional_properties: nil)
      @length = length
      @frequency = frequency
      @additional_properties = additional_properties
      @_field_set = { "length": length, "frequency": frequency }
    end

    # Deserialize a JSON object to an instance of StreakResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::StreakResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      length = parsed_json["length"]
      frequency = parsed_json["frequency"]
      new(
        length: length,
        frequency: frequency,
        additional_properties: struct
      )
    end

    # Serialize an instance of StreakResponse to a JSON object
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
      obj.length.is_a?(Integer) != false || raise("Passed value for field obj.length is not the expected type, validation failed.")
      obj.frequency.is_a?(TrophyApiClient::StreakFrequency) != false || raise("Passed value for field obj.frequency is not the expected type, validation failed.")
    end
  end
end
