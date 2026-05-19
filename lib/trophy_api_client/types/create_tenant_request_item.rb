# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # A tenant to create.
  class CreateTenantRequestItem
    # @return [String] The external customer ID. Must be unique within the environment.
    attr_reader :customer_id
    # @return [String] Human-readable name for the tenant.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer_id [String] The external customer ID. Must be unique within the environment.
    # @param name [String] Human-readable name for the tenant.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::CreateTenantRequestItem]
    def initialize(customer_id:, name:, additional_properties: nil)
      @customer_id = customer_id
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "customerId": customer_id, "name": name }
    end

    # Deserialize a JSON object to an instance of CreateTenantRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::CreateTenantRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      customer_id = parsed_json["customerId"]
      name = parsed_json["name"]
      new(
        customer_id: customer_id,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateTenantRequestItem to a JSON object
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
      obj.customer_id.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
