# frozen_string_literal: true

module Trophy
  module Types
    # An optional badge for the achievement.
    class CreateAchievementRequestItemBadge < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
