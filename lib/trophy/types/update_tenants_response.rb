# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated tenants and any issues.
    class UpdateTenantsResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminTenant] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
