# frozen_string_literal: true

module Trophy
  module Types
    # Response containing users whose streaks were reset and any issues encountered.
    class ResetStreaksResponse < Internal::Types::Model
      field :reset_users, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "resetUsers"

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
