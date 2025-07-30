# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module TrophyApiClient
  # A user of your application.
  class User
    # @return [Boolean] Whether the user is in the control group, meaning they do not receive emails or
    #  other communications from Trophy.
    attr_reader :control
    # @return [DateTime] The date and time the user was created, in ISO 8601 format.
    attr_reader :created
    # @return [DateTime] The date and time the user was last updated, in ISO 8601 format.
    attr_reader :updated
    # @return [String] The ID of the user in your database. Must be a string.
    attr_reader :id
    # @return [String] The user's email address. Required if subscribeToEmails is true.
    attr_reader :email
    # @return [String] The name to refer to the user by in emails.
    attr_reader :name
    # @return [String] The user's timezone (used for email scheduling).
    attr_reader :tz
    # @return [Array<String>] The user's device tokens, used for push notifications.
    attr_reader :device_tokens
    # @return [Boolean] Whether the user should receive Trophy-powered emails. If false, Trophy will not
    #  store the user's email address.
    attr_reader :subscribe_to_emails
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param control [Boolean] Whether the user is in the control group, meaning they do not receive emails or
    #  other communications from Trophy.
    # @param created [DateTime] The date and time the user was created, in ISO 8601 format.
    # @param updated [DateTime] The date and time the user was last updated, in ISO 8601 format.
    # @param id [String] The ID of the user in your database. Must be a string.
    # @param email [String] The user's email address. Required if subscribeToEmails is true.
    # @param name [String] The name to refer to the user by in emails.
    # @param tz [String] The user's timezone (used for email scheduling).
    # @param device_tokens [Array<String>] The user's device tokens, used for push notifications.
    # @param subscribe_to_emails [Boolean] Whether the user should receive Trophy-powered emails. If false, Trophy will not
    #  store the user's email address.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TrophyApiClient::User]
    def initialize(id:, control: OMIT, created: OMIT, updated: OMIT, email: OMIT, name: OMIT, tz: OMIT,
                   device_tokens: OMIT, subscribe_to_emails: OMIT, additional_properties: nil)
      @control = control if control != OMIT
      @created = created if created != OMIT
      @updated = updated if updated != OMIT
      @id = id
      @email = email if email != OMIT
      @name = name if name != OMIT
      @tz = tz if tz != OMIT
      @device_tokens = device_tokens if device_tokens != OMIT
      @subscribe_to_emails = subscribe_to_emails if subscribe_to_emails != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "control": control,
        "created": created,
        "updated": updated,
        "id": id,
        "email": email,
        "name": name,
        "tz": tz,
        "deviceTokens": device_tokens,
        "subscribeToEmails": subscribe_to_emails
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of User
    #
    # @param json_object [String]
    # @return [TrophyApiClient::User]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      control = parsed_json["control"]
      created = (DateTime.parse(parsed_json["created"]) unless parsed_json["created"].nil?)
      updated = (DateTime.parse(parsed_json["updated"]) unless parsed_json["updated"].nil?)
      id = parsed_json["id"]
      email = parsed_json["email"]
      name = parsed_json["name"]
      tz = parsed_json["tz"]
      device_tokens = parsed_json["deviceTokens"]
      subscribe_to_emails = parsed_json["subscribeToEmails"]
      new(
        control: control,
        created: created,
        updated: updated,
        id: id,
        email: email,
        name: name,
        tz: tz,
        device_tokens: device_tokens,
        subscribe_to_emails: subscribe_to_emails,
        additional_properties: struct
      )
    end

    # Serialize an instance of User to a JSON object
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
      obj.control&.is_a?(Boolean) != false || raise("Passed value for field obj.control is not the expected type, validation failed.")
      obj.created&.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.updated&.is_a?(DateTime) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tz&.is_a?(String) != false || raise("Passed value for field obj.tz is not the expected type, validation failed.")
      obj.device_tokens&.is_a?(Array) != false || raise("Passed value for field obj.device_tokens is not the expected type, validation failed.")
      obj.subscribe_to_emails&.is_a?(Boolean) != false || raise("Passed value for field obj.subscribe_to_emails is not the expected type, validation failed.")
    end
  end
end
