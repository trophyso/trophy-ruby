# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # A user's metric data for a wrapped period.
  class WrappedMetric
    # @return [String] The name of the metric.
    attr_reader :name
    # @return [String] The units of the metric.
    attr_reader :units
    # @return [Float] The user's current total for the metric.
    attr_reader :current_total
    # @return [Float] The change in the metric value during the period.
    attr_reader :change_this_period
    # @return [Float] The percentage change in the metric value during the period.
    attr_reader :percent_change
    # @return [Float] The user's percentile rank for this metric during the period. Only included for
    #  weekly, monthly, and yearly aggregation periods.
    attr_reader :percentile_this_period
    # @return [Hash{String => Hash}] Metric data broken down by attribute key and value.
    attr_reader :by_attribute
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the metric.
    # @param units [String] The units of the metric.
    # @param current_total [Float] The user's current total for the metric.
    # @param change_this_period [Float] The change in the metric value during the period.
    # @param percent_change [Float] The percentage change in the metric value during the period.
    # @param percentile_this_period [Float] The user's percentile rank for this metric during the period. Only included for
    #  weekly, monthly, and yearly aggregation periods.
    # @param by_attribute [Hash{String => Hash}] Metric data broken down by attribute key and value.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::WrappedMetric]
    def initialize(name:, current_total:, change_this_period:, percent_change:, by_attribute:, units: OMIT,
                   percentile_this_period: OMIT, additional_properties: nil)
      @name = name
      @units = units if units != OMIT
      @current_total = current_total
      @change_this_period = change_this_period
      @percent_change = percent_change
      @percentile_this_period = percentile_this_period if percentile_this_period != OMIT
      @by_attribute = by_attribute
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "units": units,
        "currentTotal": current_total,
        "changeThisPeriod": change_this_period,
        "percentChange": percent_change,
        "percentileThisPeriod": percentile_this_period,
        "byAttribute": by_attribute
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WrappedMetric
    #
    # @param json_object [String]
    # @return [TrophyApiClient::WrappedMetric]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      units = parsed_json["units"]
      current_total = parsed_json["currentTotal"]
      change_this_period = parsed_json["changeThisPeriod"]
      percent_change = parsed_json["percentChange"]
      percentile_this_period = parsed_json["percentileThisPeriod"]
      by_attribute = parsed_json["byAttribute"]&.transform_values do |value|
        value&.transform_values do |value|
          value = value.to_json
          TrophyApiClient::WrappedMetricByAttributeValueValue.from_json(json_object: value)
        end
      end
      new(
        name: name,
        units: units,
        current_total: current_total,
        change_this_period: change_this_period,
        percent_change: percent_change,
        percentile_this_period: percentile_this_period,
        by_attribute: by_attribute,
        additional_properties: struct
      )
    end

    # Serialize an instance of WrappedMetric to a JSON object
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
      obj.units&.is_a?(String) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
      obj.current_total.is_a?(Float) != false || raise("Passed value for field obj.current_total is not the expected type, validation failed.")
      obj.change_this_period.is_a?(Float) != false || raise("Passed value for field obj.change_this_period is not the expected type, validation failed.")
      obj.percent_change.is_a?(Float) != false || raise("Passed value for field obj.percent_change is not the expected type, validation failed.")
      obj.percentile_this_period&.is_a?(Float) != false || raise("Passed value for field obj.percentile_this_period is not the expected type, validation failed.")
      obj.by_attribute.is_a?(Hash) != false || raise("Passed value for field obj.by_attribute is not the expected type, validation failed.")
    end
  end
end
