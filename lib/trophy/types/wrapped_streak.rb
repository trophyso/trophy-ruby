# frozen_string_literal: true

module Trophy
  module Types
    # The user's longest streak during the wrapped period.
    class WrappedStreak < Internal::Types::Model
      field :length, -> { Integer }, optional: false, nullable: false

      field :frequency, -> { Trophy::Types::StreakFrequency }, optional: false, nullable: false

      field :period_start, -> { String }, optional: true, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: true, nullable: false, api_name: "periodEnd"

      field :started, -> { String }, optional: true, nullable: false
    end
  end
end
