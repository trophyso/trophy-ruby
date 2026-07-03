# frozen_string_literal: true

module Trophy
  module Types
    # An object representing a past streak period.
    class StreakResponseStreakHistoryItem < Internal::Types::Model
      field :period_start, -> { String }, optional: false, nullable: false, api_name: "periodStart"

      field :period_end, -> { String }, optional: false, nullable: false, api_name: "periodEnd"

      field :length, -> { Integer }, optional: false, nullable: false

      field :used_freeze, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "usedFreeze"
    end
  end
end
