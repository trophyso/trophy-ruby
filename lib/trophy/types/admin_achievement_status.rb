# frozen_string_literal: true

module Trophy
  module Types
    module AdminAchievementStatus
      extend Trophy::Internal::Types::Enum

      ACTIVE = "active"
      INACTIVE = "inactive"
      LOCKED = "locked"
    end
  end
end
