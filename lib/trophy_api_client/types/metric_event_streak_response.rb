# frozen_string_literal: true

require_relative "streak_frequency"
require "ostruct"
require "json"

module TrophyApiClient
  # An object representing the user's streak after sending a metric event.
  class MetricEventStreakResponse
    # @return [Boolean] Whether this metric event increased the user's streak length.
    attr_reader :extended
    # @return [Integer] The length of the user's current streak.
    attr_reader :length
    # @return [TrophyApiClient::StreakFrequency] The frequency of the streak.
    attr_reader :frequency
    # @return [String] The date the streak started.
    attr_reader :started
    # @return [String] The start date of the current streak period.
    attr_reader :period_start
    # @return [String] The end date of the current streak period.
    attr_reader :period_end
    # @return [String] The date the streak will expire if the user does not increment a metric.
    attr_reader :expires
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param extended [Boolean] Whether this metric event increased the user's streak length.
    # @param length [Integer] The length of the user's current streak.
    # @param frequency [TrophyApiClient::StreakFrequency] The frequency of the streak.
    # @param started [String] The date the streak started.
    # @param period_start [String] The start date of the current streak period.
    # @param period_end [String] The end date of the current streak period.
    # @param expires [String] The date the streak will expire if the user does not increment a metric.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::MetricEventStreakResponse]
    def initialize(length:, frequency:, extended: OMIT, started: OMIT, period_start: OMIT, period_end: OMIT,
                   expires: OMIT, additional_properties: nil)
      @extended = extended if extended != OMIT
      @length = length
      @frequency = frequency
      @started = started if started != OMIT
      @period_start = period_start if period_start != OMIT
      @period_end = period_end if period_end != OMIT
      @expires = expires if expires != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "extended": extended,
        "length": length,
        "frequency": frequency,
        "started": started,
        "periodStart": period_start,
        "periodEnd": period_end,
        "expires": expires
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MetricEventStreakResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::MetricEventStreakResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      extended = parsed_json["extended"]
      length = parsed_json["length"]
      frequency = parsed_json["frequency"]
      started = parsed_json["started"]
      period_start = parsed_json["periodStart"]
      period_end = parsed_json["periodEnd"]
      expires = parsed_json["expires"]
      new(
        extended: extended,
        length: length,
        frequency: frequency,
        started: started,
        period_start: period_start,
        period_end: period_end,
        expires: expires,
        additional_properties: struct
      )
    end

    # Serialize an instance of MetricEventStreakResponse to a JSON object
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
      obj.extended&.is_a?(Boolean) != false || raise("Passed value for field obj.extended is not the expected type, validation failed.")
      obj.length.is_a?(Integer) != false || raise("Passed value for field obj.length is not the expected type, validation failed.")
      obj.frequency.is_a?(TrophyApiClient::StreakFrequency) != false || raise("Passed value for field obj.frequency is not the expected type, validation failed.")
      obj.started&.is_a?(String) != false || raise("Passed value for field obj.started is not the expected type, validation failed.")
      obj.period_start&.is_a?(String) != false || raise("Passed value for field obj.period_start is not the expected type, validation failed.")
      obj.period_end&.is_a?(String) != false || raise("Passed value for field obj.period_end is not the expected type, validation failed.")
      obj.expires&.is_a?(String) != false || raise("Passed value for field obj.expires is not the expected type, validation failed.")
    end
  end
end
