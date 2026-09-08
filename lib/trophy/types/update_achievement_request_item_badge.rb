# frozen_string_literal: true

module Trophy
  module Types
    class UpdateAchievementRequestItemBadge < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
