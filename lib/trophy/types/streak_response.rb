# frozen_string_literal: true

module Trophy
  module Types
    # An object representing the user's streak.
    class StreakResponse < Internal::Types::Model
      field :length, -> { Integer }, optional: false, nullable: false

      field :frequency, -> { Trophy::Types::StreakFrequency }, optional: false, nullable: false

      field :started, -> { String }, optional: true, nullable: false

      field :period_start, -> { String }, optional: true, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: true, nullable: false, api_name: "periodEnd"

      field :expires, -> { String }, optional: true, nullable: false

      field :freezes, -> { Integer }, optional: true, nullable: false

      field :max_freezes, -> { Integer }, optional: true, nullable: false, api_name: "maxFreezes"

      field :freeze_auto_earn_interval, -> { Integer }, optional: true, nullable: false, api_name: "freezeAutoEarnInterval"

      field :freeze_auto_earn_amount, -> { Integer }, optional: true, nullable: false, api_name: "freezeAutoEarnAmount"

      field :extended, -> { String }, optional: true, nullable: false

      field :streak_history, -> { Internal::Types::Array[Trophy::Types::StreakResponseStreakHistoryItem] }, optional: false, nullable: false, api_name: "streakHistory"
    end
  end
end
