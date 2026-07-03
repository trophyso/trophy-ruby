# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created attributes and any per-item issues.
    class CreateAttributesResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminAttribute] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
