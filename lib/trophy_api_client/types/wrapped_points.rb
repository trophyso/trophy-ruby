# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # A user's points data for a wrapped period.
  class WrappedPoints
    # @return [String] The name of the points system.
    attr_reader :name
    # @return [String] The description of the points system.
    attr_reader :description
    # @return [Float] The user's current total points.
    attr_reader :current_total
    # @return [Float] The change in points during the period.
    attr_reader :change_this_period
    # @return [Float] The percentage change in points during the period.
    attr_reader :percent_change
    # @return [Float] The user's percentile rank for this points system during the period. Only
    #  included for weekly, monthly, and yearly aggregation periods.
    attr_reader :percentile_this_period
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the points system.
    # @param description [String] The description of the points system.
    # @param current_total [Float] The user's current total points.
    # @param change_this_period [Float] The change in points during the period.
    # @param percent_change [Float] The percentage change in points during the period.
    # @param percentile_this_period [Float] The user's percentile rank for this points system during the period. Only
    #  included for weekly, monthly, and yearly aggregation periods.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WrappedPoints]
    def initialize(name:, current_total:, change_this_period:, percent_change:, description: OMIT,
                   percentile_this_period: OMIT, additional_properties: nil)
      @name = name
      @description = description if description != OMIT
      @current_total = current_total
      @change_this_period = change_this_period
      @percent_change = percent_change
      @percentile_this_period = percentile_this_period if percentile_this_period != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "description": description,
        "currentTotal": current_total,
        "changeThisPeriod": change_this_period,
        "percentChange": percent_change,
        "percentileThisPeriod": percentile_this_period
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WrappedPoints
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WrappedPoints]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      description = parsed_json["description"]
      current_total = parsed_json["currentTotal"]
      change_this_period = parsed_json["changeThisPeriod"]
      percent_change = parsed_json["percentChange"]
      percentile_this_period = parsed_json["percentileThisPeriod"]
      new(
        name: name,
        description: description,
        current_total: current_total,
        change_this_period: change_this_period,
        percent_change: percent_change,
        percentile_this_period: percentile_this_period,
        additional_properties: struct
      )
    end

    # Serialize an instance of WrappedPoints to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.current_total.is_a?(Float) != false || raise("Passed value for field obj.current_total is not the expected type, validation failed.")
      obj.change_this_period.is_a?(Float) != false || raise("Passed value for field obj.change_this_period is not the expected type, validation failed.")
      obj.percent_change.is_a?(Float) != false || raise("Passed value for field obj.percent_change is not the expected type, validation failed.")
      obj.percentile_this_period&.is_a?(Float) != false || raise("Passed value for field obj.percentile_this_period is not the expected type, validation failed.")
    end
  end
end
