# frozen_string_literal: true

require_relative "created_metric_unit_type"
require "ostruct"
require "json"

module TrophyApiClient
  # A successfully created metric returned from the create endpoint.
  class CreatedMetric
    # @return [String] The UUID of the created metric.
    attr_reader :id
    # @return [String] The metric name.
    attr_reader :name
    # @return [String] The metric key.
    attr_reader :key
    # @return [TrophyApiClient::CreatedMetricUnitType] The metric unit type.
    attr_reader :unit_type
    # @return [String] The stored units value for the metric.
    attr_reader :units
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the created metric.
    # @param name [String] The metric name.
    # @param key [String] The metric key.
    # @param unit_type [TrophyApiClient::CreatedMetricUnitType] The metric unit type.
    # @param units [String] The stored units value for the metric.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreatedMetric]
    def initialize(id:, name:, key:, unit_type:, units:, additional_properties: nil)
      @id = id
      @name = name
      @key = key
      @unit_type = unit_type
      @units = units
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "key": key, "unitType": unit_type, "units": units }
    end

    # Deserialize a JSON object to an instance of CreatedMetric
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreatedMetric]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      key = parsed_json["key"]
      unit_type = parsed_json["unitType"]
      units = parsed_json["units"]
      new(
        id: id,
        name: name,
        key: key,
        unit_type: unit_type,
        units: units,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreatedMetric to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.unit_type.is_a?(TrophyApiClient::CreatedMetricUnitType) != false || raise("Passed value for field obj.unit_type is not the expected type, validation failed.")
      obj.units.is_a?(String) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
    end
  end
end
