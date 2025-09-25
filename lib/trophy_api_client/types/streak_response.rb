# frozen_string_literal: true

require_relative "streak_response_streak_history_item"
require_relative "streak_frequency"
require "ostruct"
require "json"

module TrophyApiClient
  # An object representing the user's streak.
  class StreakResponse
    # @return [Array<TrophyApiClient::StreakResponseStreakHistoryItem>] A list of the user's past streak periods up through the current period. Each
    #  period includes the start and end dates and the length of the streak.
    attr_reader :streak_history
    # @return [Integer] The user's rank across all users. Null if the user has no active streak.
    attr_reader :rank
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
    # @return [Integer] The number of available streak freezes. Only present if the organization has
    #  enabled streak freezes.
    attr_reader :freezes
    # @return [Integer] The maximum number of streak freezes a user can have. Only present if the
    #  organization has enabled streak freezes.
    attr_reader :max_freezes
    # @return [Integer] The interval at which the user will earn streak freezes, in days. Only present
    #  if the organization has enabled streak freeze auto-earn.
    attr_reader :freeze_auto_earn_interval
    # @return [Integer] The amount of streak freezes the user will earn per interval. Only present if
    #  the organization has enabled streak freeze auto-earn.
    attr_reader :freeze_auto_earn_amount
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param streak_history [Array<TrophyApiClient::StreakResponseStreakHistoryItem>] A list of the user's past streak periods up through the current period. Each
    #  period includes the start and end dates and the length of the streak.
    # @param rank [Integer] The user's rank across all users. Null if the user has no active streak.
    # @param length [Integer] The length of the user's current streak.
    # @param frequency [TrophyApiClient::StreakFrequency] The frequency of the streak.
    # @param started [String] The date the streak started.
    # @param period_start [String] The start date of the current streak period.
    # @param period_end [String] The end date of the current streak period.
    # @param expires [String] The date the streak will expire if the user does not increment a metric.
    # @param freezes [Integer] The number of available streak freezes. Only present if the organization has
    #  enabled streak freezes.
    # @param max_freezes [Integer] The maximum number of streak freezes a user can have. Only present if the
    #  organization has enabled streak freezes.
    # @param freeze_auto_earn_interval [Integer] The interval at which the user will earn streak freezes, in days. Only present
    #  if the organization has enabled streak freeze auto-earn.
    # @param freeze_auto_earn_amount [Integer] The amount of streak freezes the user will earn per interval. Only present if
    #  the organization has enabled streak freeze auto-earn.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::StreakResponse]
    def initialize(length:, frequency:, streak_history: OMIT, rank: OMIT, started: OMIT, period_start: OMIT,
                   period_end: OMIT, expires: OMIT, freezes: OMIT, max_freezes: OMIT, freeze_auto_earn_interval: OMIT, freeze_auto_earn_amount: OMIT, additional_properties: nil)
      @streak_history = streak_history if streak_history != OMIT
      @rank = rank if rank != OMIT
      @length = length
      @frequency = frequency
      @started = started if started != OMIT
      @period_start = period_start if period_start != OMIT
      @period_end = period_end if period_end != OMIT
      @expires = expires if expires != OMIT
      @freezes = freezes if freezes != OMIT
      @max_freezes = max_freezes if max_freezes != OMIT
      @freeze_auto_earn_interval = freeze_auto_earn_interval if freeze_auto_earn_interval != OMIT
      @freeze_auto_earn_amount = freeze_auto_earn_amount if freeze_auto_earn_amount != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "streakHistory": streak_history,
        "rank": rank,
        "length": length,
        "frequency": frequency,
        "started": started,
        "periodStart": period_start,
        "periodEnd": period_end,
        "expires": expires,
        "freezes": freezes,
        "maxFreezes": max_freezes,
        "freezeAutoEarnInterval": freeze_auto_earn_interval,
        "freezeAutoEarnAmount": freeze_auto_earn_amount
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of StreakResponse
    #
    # @param json_object [String]
    # @return [TrophyApiClient::StreakResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      streak_history = parsed_json["streakHistory"]&.map do |item|
        item = item.to_json
        TrophyApiClient::StreakResponseStreakHistoryItem.from_json(json_object: item)
      end
      rank = parsed_json["rank"]
      length = parsed_json["length"]
      frequency = parsed_json["frequency"]
      started = parsed_json["started"]
      period_start = parsed_json["periodStart"]
      period_end = parsed_json["periodEnd"]
      expires = parsed_json["expires"]
      freezes = parsed_json["freezes"]
      max_freezes = parsed_json["maxFreezes"]
      freeze_auto_earn_interval = parsed_json["freezeAutoEarnInterval"]
      freeze_auto_earn_amount = parsed_json["freezeAutoEarnAmount"]
      new(
        streak_history: streak_history,
        rank: rank,
        length: length,
        frequency: frequency,
        started: started,
        period_start: period_start,
        period_end: period_end,
        expires: expires,
        freezes: freezes,
        max_freezes: max_freezes,
        freeze_auto_earn_interval: freeze_auto_earn_interval,
        freeze_auto_earn_amount: freeze_auto_earn_amount,
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
      obj.streak_history&.is_a?(Array) != false || raise("Passed value for field obj.streak_history is not the expected type, validation failed.")
      obj.rank&.is_a?(Integer) != false || raise("Passed value for field obj.rank is not the expected type, validation failed.")
      obj.length.is_a?(Integer) != false || raise("Passed value for field obj.length is not the expected type, validation failed.")
      obj.frequency.is_a?(TrophyApiClient::StreakFrequency) != false || raise("Passed value for field obj.frequency is not the expected type, validation failed.")
      obj.started&.is_a?(String) != false || raise("Passed value for field obj.started is not the expected type, validation failed.")
      obj.period_start&.is_a?(String) != false || raise("Passed value for field obj.period_start is not the expected type, validation failed.")
      obj.period_end&.is_a?(String) != false || raise("Passed value for field obj.period_end is not the expected type, validation failed.")
      obj.expires&.is_a?(String) != false || raise("Passed value for field obj.expires is not the expected type, validation failed.")
      obj.freezes&.is_a?(Integer) != false || raise("Passed value for field obj.freezes is not the expected type, validation failed.")
      obj.max_freezes&.is_a?(Integer) != false || raise("Passed value for field obj.max_freezes is not the expected type, validation failed.")
      obj.freeze_auto_earn_interval&.is_a?(Integer) != false || raise("Passed value for field obj.freeze_auto_earn_interval is not the expected type, validation failed.")
      obj.freeze_auto_earn_amount&.is_a?(Integer) != false || raise("Passed value for field obj.freeze_auto_earn_amount is not the expected type, validation failed.")
    end
  end
end
