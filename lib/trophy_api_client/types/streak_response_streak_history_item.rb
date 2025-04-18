# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # An object representing a past streak period.
  class StreakResponseStreakHistoryItem
    # @return [String] The date this streak period started.
    attr_reader :period_start
    # @return [String] The date this streak period ended.
    attr_reader :period_end
    # @return [Integer] The length of the user's streak during this period.
    attr_reader :length
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param period_start [String] The date this streak period started.
    # @param period_end [String] The date this streak period ended.
    # @param length [Integer] The length of the user's streak during this period.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::StreakResponseStreakHistoryItem]
    def initialize(period_start:, period_end:, length:, additional_properties: nil)
      @period_start = period_start
      @period_end = period_end
      @length = length
      @additional_properties = additional_properties
      @_field_set = { "periodStart": period_start, "periodEnd": period_end, "length": length }
    end

    # Deserialize a JSON object to an instance of StreakResponseStreakHistoryItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::StreakResponseStreakHistoryItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      period_start = parsed_json["periodStart"]
      period_end = parsed_json["periodEnd"]
      length = parsed_json["length"]
      new(
        period_start: period_start,
        period_end: period_end,
        length: length,
        additional_properties: struct
      )
    end

    # Serialize an instance of StreakResponseStreakHistoryItem to a JSON object
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
      obj.period_start.is_a?(String) != false || raise("Passed value for field obj.period_start is not the expected type, validation failed.")
      obj.period_end.is_a?(String) != false || raise("Passed value for field obj.period_end is not the expected type, validation failed.")
      obj.length.is_a?(Integer) != false || raise("Passed value for field obj.length is not the expected type, validation failed.")
    end
  end
end
