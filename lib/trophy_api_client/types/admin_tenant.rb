# frozen_string_literal: true

require_relative "admin_tenant_status"
require "date"
require "ostruct"
require "json"

module TrophyApiClient
  # A tenant in a multi-tenant environment.
  class AdminTenant
    # @return [String] The tenant UUID.
    attr_reader :id
    # @return [String] The external customer ID for this tenant.
    attr_reader :customer_id
    # @return [String] Human-readable name for the tenant.
    attr_reader :name
    # @return [TrophyApiClient::AdminTenantStatus] The lifecycle status of the tenant.
    attr_reader :status
    # @return [DateTime] When the tenant was created.
    attr_reader :created
    # @return [DateTime] When the tenant was last updated.
    attr_reader :updated
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The tenant UUID.
    # @param customer_id [String] The external customer ID for this tenant.
    # @param name [String] Human-readable name for the tenant.
    # @param status [TrophyApiClient::AdminTenantStatus] The lifecycle status of the tenant.
    # @param created [DateTime] When the tenant was created.
    # @param updated [DateTime] When the tenant was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::AdminTenant]
    def initialize(id:, customer_id:, name:, status:, created:, updated:, additional_properties: nil)
      @id = id
      @customer_id = customer_id
      @name = name
      @status = status
      @created = created
      @updated = updated
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "customerId": customer_id,
        "name": name,
        "status": status,
        "created": created,
        "updated": updated
      }
    end

    # Deserialize a JSON object to an instance of AdminTenant
    #
    # @param json_object [String]
    # @return [TrophyApiClient::AdminTenant]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      customer_id = parsed_json["customerId"]
      name = parsed_json["name"]
      status = parsed_json["status"]
      created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
      updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
      new(
        id: id,
        customer_id: customer_id,
        name: name,
        status: status,
        created: created,
        updated: updated,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdminTenant to a JSON object
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
      obj.customer_id.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status.is_a?(TrophyApiClient::AdminTenantStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
    end
  end
end
