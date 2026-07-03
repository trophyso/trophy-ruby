# frozen_string_literal: true

module Trophy
  module Types
    class BaseStreakResponse < Internal::Types::Model
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
    end
  end
end
