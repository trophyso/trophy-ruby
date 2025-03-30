# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  # An object with editable user fields.
  class UpdatedUser
    # @return [String] The user's email address. Required if subscribeToEmails is true.
    attr_reader :email
    # @return [String] The name to refer to the user by in emails.
    attr_reader :name
    # @return [String] The user's timezone (used for email scheduling).
    attr_reader :tz
    # @return [Boolean] Whether the user should receive Trophy-powered emails. Cannot be false if an
    #  email is provided.
    attr_reader :subscribe_to_emails
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] The user's email address. Required if subscribeToEmails is true.
    # @param name [String] The name to refer to the user by in emails.
    # @param tz [String] The user's timezone (used for email scheduling).
    # @param subscribe_to_emails [Boolean] Whether the user should receive Trophy-powered emails. Cannot be false if an
    #  email is provided.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::UpdatedUser]
    def initialize(email: OMIT, name: OMIT, tz: OMIT, subscribe_to_emails: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @name = name if name != OMIT
      @tz = tz if tz != OMIT
      @subscribe_to_emails = subscribe_to_emails if subscribe_to_emails != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "email": email,
        "name": name,
        "tz": tz,
        "subscribeToEmails": subscribe_to_emails
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdatedUser
    #
    # @param json_object [String]
    # @return [TrophyApiClient::UpdatedUser]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      name = parsed_json["name"]
      tz = parsed_json["tz"]
      subscribe_to_emails = parsed_json["subscribeToEmails"]
      new(
        email: email,
        name: name,
        tz: tz,
        subscribe_to_emails: subscribe_to_emails,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdatedUser to a JSON object
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
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tz&.is_a?(String) != false || raise("Passed value for field obj.tz is not the expected type, validation failed.")
      obj.subscribe_to_emails&.is_a?(Boolean) != false || raise("Passed value for field obj.subscribe_to_emails is not the expected type, validation failed.")
    end
  end
end
