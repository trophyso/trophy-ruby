# frozen_string_literal: true

require "ostruct"
require "json"

module TrophyApiClient
  module Admin
    module Streaks
      class Freezes
        class CreateStreakFreezesRequestFreezesItem
          # @return [String] The ID of the user to create a freeze for.
          attr_reader :user_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param user_id [String] The ID of the user to create a freeze for.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [TrophyApiClient::Admin::Streaks::Freezes::CreateStreakFreezesRequestFreezesItem]
          def initialize(user_id:, additional_properties: nil)
            @user_id = user_id
            @additional_properties = additional_properties
            @_field_set = { "userId": user_id }
          end

          # Deserialize a JSON object to an instance of
          #  CreateStreakFreezesRequestFreezesItem
          #
          # @param json_object [String]
          # @return [TrophyApiClient::Admin::Streaks::Freezes::CreateStreakFreezesRequestFreezesItem]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            user_id = parsed_json["userId"]
            new(user_id: user_id, additional_properties: struct)
          end

          # Serialize an instance of CreateStreakFreezesRequestFreezesItem to a JSON object
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
            obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
