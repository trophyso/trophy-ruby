# frozen_string_literal: true

module Trophy
  module Achievements
    module Types
      class AchievementsCompleteRequest < Internal::Types::Model
        field :key, -> { String }, optional: false, nullable: false

        field :user, -> { Trophy::Types::UpsertedUser }, optional: false, nullable: false
      end
    end
  end
end
