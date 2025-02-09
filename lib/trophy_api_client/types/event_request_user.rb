# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # The user that triggered the event.
  class EventRequestUser
    # @return [String] The ID of the user in your database. Must be a string.
    attr_reader :id
    # @return [String] The user's email address.
    attr_reader :email
    # @return [String] The name to refer to the user by in emails.
    attr_reader :name
    # @return [String] The user's timezone (used for email scheduling).
    attr_reader :tz
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the user in your database. Must be a string.
    # @param email [String] The user's email address.
    # @param name [String] The name to refer to the user by in emails.
    # @param tz [String] The user's timezone (used for email scheduling).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::EventRequestUser]
    def initialize(id:, email: OMIT, name: OMIT, tz: OMIT, additional_properties: nil)
      @id = id
      @email = email if email != OMIT
      @name = name if name != OMIT
      @tz = tz if tz != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "email": email, "name": name, "tz": tz }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EventRequestUser
    #
    # @param json_object [String]
    # @return [TrophyApiClient::EventRequestUser]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      email = parsed_json["email"]
      name = parsed_json["name"]
      tz = parsed_json["tz"]
      new(
        id: id,
        email: email,
        name: name,
        tz: tz,
        additional_properties: struct
      )
    end

    # Serialize an instance of EventRequestUser to a JSON object
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
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tz&.is_a?(String) != false || raise("Passed value for field obj.tz is not the expected type, validation failed.")
    end
  end
end
