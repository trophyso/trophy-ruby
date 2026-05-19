# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # A tenant to update.
  class UpdateTenantRequestItem
    # @return [String] The UUID of the tenant to update.
    attr_reader :id
    # @return [String] New external customer ID.
    attr_reader :customer_id
    # @return [String] New display name for the tenant.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID of the tenant to update.
    # @param customer_id [String] New external customer ID.
    # @param name [String] New display name for the tenant.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::UpdateTenantRequestItem]
    def initialize(id:, customer_id: OMIT, name: OMIT, additional_properties: nil)
      @id = id
      @customer_id = customer_id if customer_id != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "customerId": customer_id, "name": name }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateTenantRequestItem
    #
    # @param json_object [String]
    # @return [TrophyApiClient::UpdateTenantRequestItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      customer_id = parsed_json["customerId"]
      name = parsed_json["name"]
      new(
        id: id,
        customer_id: customer_id,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateTenantRequestItem to a JSON object
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
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
