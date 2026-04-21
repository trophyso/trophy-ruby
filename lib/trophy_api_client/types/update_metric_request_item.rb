# frozen_string_literal: true

require_relative "update_metric_request_item_unit_type"
require "ostruct"
require "json"

module TrophyApiClient
  # A metric update object. `id` is required; `name`, `unitType`, and `units` are
  #  optional. `key` cannot be changed through this endpoint.
  class UpdateMetricRequestItem
    # @return [String] The UUID of the metric to update.
    attr_reader :id
    # @return [String] The updated metric name.
    attr_reader :name
    # @return [TrophyApiClient::UpdateMetricRequestItemUnitType] The updated metric unit type.
    attr_reader :unit_type
    # @return [String] The updated units value. For `unitType: currency`, this must be a supported
    #  `MetricCurrency` code such as `USD`.
    attr_reader :units
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the metric to update.
    # @param name [String] The updated metric name.
    # @param unit_type [TrophyApiClient::UpdateMetricRequestItemUnitType] The updated metric unit type.
    # @param units [String] The updated units value. For `unitType: currency`, this must be a supported
    #  `MetricCurrency` code such as `USD`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::UpdateMetricRequestItem]
    def initialize(id:, name: OMIT, unit_type: OMIT, units: OMIT, additional_properties: nil)
      @id = id
      @name = name if name != OMIT
      @unit_type = unit_type if unit_type != OMIT
      @units = units if units != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "unitType": unit_type, "units": units }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateMetricRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::UpdateMetricRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      unit_type = parsed_json["unitType"]
      units = parsed_json["units"]
      new(
        id: id,
        name: name,
        unit_type: unit_type,
        units: units,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateMetricRequestItem to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.unit_type&.is_a?(TrophyApiClient::UpdateMetricRequestItemUnitType) != false || raise("Passed value for field obj.unit_type is not the expected type, validation failed.")
      obj.units&.is_a?(String) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
    end
  end
end
