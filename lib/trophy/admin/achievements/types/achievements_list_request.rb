# frozen_string_literal: true

module Trophy
  module Admin
    module Achievements
      module Types
        class AchievementsListRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false

          field :skip, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
