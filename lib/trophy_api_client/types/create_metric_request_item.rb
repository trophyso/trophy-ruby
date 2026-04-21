# frozen_string_literal: true

require_relative "create_metric_request_item_unit_type"
require "ostruct"
require "json"

module TrophyApiClient
  # A metric to create.
  class CreateMetricRequestItem
    # @return [String] The metric name.
    attr_reader :name
    # @return [String] The metric key. Only alphanumeric characters, hyphens, and underscores are
    #  permitted.
    attr_reader :key
    # @return [TrophyApiClient::CreateMetricRequestItemUnitType] The metric unit type. Defaults to `number`.
    attr_reader :unit_type
    # @return [String] For `unitType: currency`, this must be a supported `MetricCurrency` code such as
    #  `USD`. For `number`, this is an optional freeform unit label.
    attr_reader :units
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The metric name.
    # @param key [String] The metric key. Only alphanumeric characters, hyphens, and underscores are
    #  permitted.
    # @param unit_type [TrophyApiClient::CreateMetricRequestItemUnitType] The metric unit type. Defaults to `number`.
    # @param units [String] For `unitType: currency`, this must be a supported `MetricCurrency` code such as
    #  `USD`. For `number`, this is an optional freeform unit label.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreateMetricRequestItem]
    def initialize(name:, key:, unit_type: OMIT, units: OMIT, additional_properties: nil)
      @name = name
      @key = key
      @unit_type = unit_type if unit_type != OMIT
      @units = units if units != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "key": key, "unitType": unit_type, "units": units }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateMetricRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreateMetricRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      key = parsed_json["key"]
      unit_type = parsed_json["unitType"]
      units = parsed_json["units"]
      new(
        name: name,
        key: key,
        unit_type: unit_type,
        units: units,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateMetricRequestItem to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.unit_type&.is_a?(TrophyApiClient::CreateMetricRequestItemUnitType) != false || raise("Passed value for field obj.unit_type is not the expected type, validation failed.")
      obj.units&.is_a?(String) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
    end
  end
end
