# frozen_string_literal: true

require_relative "streak_frequency"
require "ostruct"
require "json"

module TrophyApiClient
  # The user's longest streak during the wrapped period.
  class WrappedStreak
    # @return [Integer] The length of the streak.
    attr_reader :length
    # @return [TrophyApiClient::StreakFrequency] The frequency of the streak.
    attr_reader :frequency
    # @return [String] The start date of the streak period.
    attr_reader :period_start
    # @return [String] The end date of the streak period.
    attr_reader :period_end
    # @return [String] The date the streak started.
    attr_reader :started
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param length [Integer] The length of the streak.
    # @param frequency [TrophyApiClient::StreakFrequency] The frequency of the streak.
    # @param period_start [String] The start date of the streak period.
    # @param period_end [String] The end date of the streak period.
    # @param started [String] The date the streak started.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WrappedStreak]
    def initialize(length:, frequency:, period_start: OMIT, period_end: OMIT, started: OMIT, additional_properties: nil)
      @length = length
      @frequency = frequency
      @period_start = period_start if period_start != OMIT
      @period_end = period_end if period_end != OMIT
      @started = started if started != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "length": length,
        "frequency": frequency,
        "periodStart": period_start,
        "periodEnd": period_end,
        "started": started
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WrappedStreak
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WrappedStreak]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      length = parsed_json["length"]
      frequency = parsed_json["frequency"]
      period_start = parsed_json["periodStart"]
      period_end = parsed_json["periodEnd"]
      started = parsed_json["started"]
      new(
        length: length,
        frequency: frequency,
        period_start: period_start,
        period_end: period_end,
        started: started,
        additional_properties: struct
      )
    end

    # Serialize an instance of WrappedStreak to a JSON object
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
      obj.period_start&.is_a?(String) != false || raise("Passed value for field obj.period_start is not the expected type, validation failed.")
      obj.period_end&.is_a?(String) != false || raise("Passed value for field obj.period_end is not the expected type, validation failed.")
      obj.started&.is_a?(String) != false || raise("Passed value for field obj.started is not the expected type, validation failed.")
    end
  end
end
