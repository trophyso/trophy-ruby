# frozen_string_literal: true

module Trophy
  module Types
    class AdminPointsTriggerEventAttributesItem < Internal::Types::Model
      field :attribute_id, -> { String }, optional: false, nullable: false, api_name: "attributeId"

      field :attribute_value, -> { String }, optional: false, nullable: false, api_name: "attributeValue"
    end
  end
end
