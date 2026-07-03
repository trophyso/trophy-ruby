# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersStreakRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :history_periods, -> { Integer }, optional: true, nullable: false, api_name: "historyPeriods"
      end
    end
  end
end
