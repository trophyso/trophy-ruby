# frozen_string_literal: true

module Trophy
  module Types
    module AdminTenantStatus
      extend Trophy::Internal::Types::Enum

      ACTIVE = "active"
      ARCHIVED = "archived"
    end
  end
end
