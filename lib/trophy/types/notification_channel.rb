# frozen_string_literal: true

module Trophy
  module Types
    module NotificationChannel
      extend Trophy::Internal::Types::Enum

      EMAIL = "email"
      PUSH = "push"
    end
  end
end
