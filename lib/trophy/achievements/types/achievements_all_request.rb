# frozen_string_literal: true

module Trophy
  module Achievements
    module Types
      class AchievementsAllRequest < Internal::Types::Model
        field :user_attributes, -> { String }, optional: true, nullable: false, api_name: "userAttributes"
      end
    end
  end
end
