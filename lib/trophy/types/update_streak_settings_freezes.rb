# frozen_string_literal: true

module Trophy
  module Types
    # Replacement freeze configuration. `startCount` and `maxCount` are required. Auto-earn is a pair: both
    # `autoEarnInterval` and `autoEarnAmount` must be set to enable auto-earn, or both omitted/`null` to disable it.
    class UpdateStreakSettingsFreezes < Internal::Types::Model
      field :start_count, -> { Integer }, optional: false, nullable: false, api_name: "startCount"

      field :max_count, -> { Integer }, optional: false, nullable: false, api_name: "maxCount"

      field :auto_earn_interval, -> { Integer }, optional: true, nullable: false, api_name: "autoEarnInterval"

      field :auto_earn_amount, -> { Integer }, optional: true, nullable: false, api_name: "autoEarnAmount"
    end
  end
end
