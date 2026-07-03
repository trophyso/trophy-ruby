# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated attributes and any per-item issues identified by attribute ID.
    class UpdateAttributesResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminAttribute] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
