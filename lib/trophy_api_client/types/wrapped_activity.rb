# frozen_string_literal: true

require_relative "wrapped_most_active_day"
require_relative "wrapped_most_active_week"
require_relative "wrapped_most_active_month"
require_relative "wrapped_entire_year"
require "ostruct"
require "json"

module TrophyApiClient
  # The user's activity summary for the wrapped year.
  class WrappedActivity
    # @return [Integer] The number of days the user was active during the year.
    attr_reader :days_active
    # @return [Integer] The number of weeks the user was active during the year.
    attr_reader :weeks_active
    # @return [Integer] The number of months the user was active during the year.
    attr_reader :months_active
    # @return [TrophyApiClient::WrappedMostActiveDay] Data about the user's most active day.
    attr_reader :most_active_day
    # @return [TrophyApiClient::WrappedMostActiveWeek] Data about the user's most active week.
    attr_reader :most_active_week
    # @return [TrophyApiClient::WrappedMostActiveMonth] Data about the user's most active month.
    attr_reader :most_active_month
    # @return [TrophyApiClient::WrappedEntireYear] Data about the user's activity for the entire year.
    attr_reader :entire_year
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param days_active [Integer] The number of days the user was active during the year.
    # @param weeks_active [Integer] The number of weeks the user was active during the year.
    # @param months_active [Integer] The number of months the user was active during the year.
    # @param most_active_day [TrophyApiClient::WrappedMostActiveDay] Data about the user's most active day.
    # @param most_active_week [TrophyApiClient::WrappedMostActiveWeek] Data about the user's most active week.
    # @param most_active_month [TrophyApiClient::WrappedMostActiveMonth] Data about the user's most active month.
    # @param entire_year [TrophyApiClient::WrappedEntireYear] Data about the user's activity for the entire year.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WrappedActivity]
    def initialize(days_active:, weeks_active:, months_active:, most_active_day:, most_active_week:,
                   most_active_month:, entire_year:, additional_properties: nil)
      @days_active = days_active
      @weeks_active = weeks_active
      @months_active = months_active
      @most_active_day = most_active_day
      @most_active_week = most_active_week
      @most_active_month = most_active_month
      @entire_year = entire_year
      @additional_properties = additional_properties
      @_field_set = {
        "daysActive": days_active,
        "weeksActive": weeks_active,
        "monthsActive": months_active,
        "mostActiveDay": most_active_day,
        "mostActiveWeek": most_active_week,
        "mostActiveMonth": most_active_month,
        "entireYear": entire_year
      }
    end

    # Deserialize a JSON object to an instance of WrappedActivity
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WrappedActivity]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      days_active = parsed_json["daysActive"]
      weeks_active = parsed_json["weeksActive"]
      months_active = parsed_json["monthsActive"]
      if parsed_json["mostActiveDay"].nil?
        most_active_day = nil
      else
        most_active_day = parsed_json["mostActiveDay"].to_json
        most_active_day = TrophyApiClient::WrappedMostActiveDay.from_json(json_object: most_active_day)
      end
      if parsed_json["mostActiveWeek"].nil?
        most_active_week = nil
      else
        most_active_week = parsed_json["mostActiveWeek"].to_json
        most_active_week = TrophyApiClient::WrappedMostActiveWeek.from_json(json_object: most_active_week)
      end
      if parsed_json["mostActiveMonth"].nil?
        most_active_month = nil
      else
        most_active_month = parsed_json["mostActiveMonth"].to_json
        most_active_month = TrophyApiClient::WrappedMostActiveMonth.from_json(json_object: most_active_month)
      end
      if parsed_json["entireYear"].nil?
        entire_year = nil
      else
        entire_year = parsed_json["entireYear"].to_json
        entire_year = TrophyApiClient::WrappedEntireYear.from_json(json_object: entire_year)
      end
      new(
        days_active: days_active,
        weeks_active: weeks_active,
        months_active: months_active,
        most_active_day: most_active_day,
        most_active_week: most_active_week,
        most_active_month: most_active_month,
        entire_year: entire_year,
        additional_properties: struct
      )
    end

    # Serialize an instance of WrappedActivity to a JSON object
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
      obj.days_active.is_a?(Integer) != false || raise("Passed value for field obj.days_active is not the expected type, validation failed.")
      obj.weeks_active.is_a?(Integer) != false || raise("Passed value for field obj.weeks_active is not the expected type, validation failed.")
      obj.months_active.is_a?(Integer) != false || raise("Passed value for field obj.months_active is not the expected type, validation failed.")
      TrophyApiClient::WrappedMostActiveDay.validate_raw(obj: obj.most_active_day)
      TrophyApiClient::WrappedMostActiveWeek.validate_raw(obj: obj.most_active_week)
      TrophyApiClient::WrappedMostActiveMonth.validate_raw(obj: obj.most_active_month)
      TrophyApiClient::WrappedEntireYear.validate_raw(obj: obj.entire_year)
    end
  end
end
