# frozen_string_literal: true

module Trophy
  module Types
    # Response containing updated achievements and any per-item issues identified by achievement ID.
    class UpdateAchievementsResponse < Internal::Types::Model
      field :updated, -> { Internal::Types::Array[Trophy::Types::AdminAchievement] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Trophy::Types::AdminIssue] }, optional: false, nullable: false
    end
  end
end
