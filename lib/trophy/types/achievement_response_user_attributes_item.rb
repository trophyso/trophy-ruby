# frozen_string_literal: true

module Trophy
  module Types
    class AchievementResponseUserAttributesItem < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
