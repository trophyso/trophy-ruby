# frozen_string_literal: true

module Trophy
  module Types
    # Organization streak freeze configuration. `null` on the parent object means freezes are disabled.
    class StreakSettingsFreezes < Internal::Types::Model
      field :start_count, -> { Integer }, optional: false, nullable: false, api_name: "startCount"

      field :max_count, -> { Integer }, optional: false, nullable: false, api_name: "maxCount"

      field :auto_earn_interval, -> { Integer }, optional: true, nullable: false, api_name: "autoEarnInterval"

      field :auto_earn_amount, -> { Integer }, optional: true, nullable: false, api_name: "autoEarnAmount"
    end
  end
end
