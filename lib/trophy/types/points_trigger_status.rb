# frozen_string_literal: true

module Trophy
  module Types
    module PointsTriggerStatus
      extend Trophy::Internal::Types::Enum

      ACTIVE = "active"
      INACTIVE = "inactive"
      ARCHIVED = "archived"
    end
  end
end
