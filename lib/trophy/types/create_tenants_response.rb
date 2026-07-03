# frozen_string_literal: true

module Trophy
  module Types
    # Response containing created tenants and any issues.
    class CreateTenantsResponse < Internal::Types::Model
      field :created, -> { Internal::Types::Array[Trophy::Types::AdminTenant] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
