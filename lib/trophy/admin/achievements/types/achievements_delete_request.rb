# frozen_string_literal: true

module Trophy
  module Admin
    module Achievements
      module Types
        class AchievementsDeleteRequest < Internal::Types::Model
          field :ids, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
