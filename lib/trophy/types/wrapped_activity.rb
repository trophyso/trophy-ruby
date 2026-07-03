# frozen_string_literal: true

module Trophy
  module Types
    # The user's activity summary for the wrapped year.
    class WrappedActivity < Internal::Types::Model
      field :days_active, -> { Integer }, optional: false, nullable: false, api_name: "daysActive"

      field :weeks_active, -> { Integer }, optional: false, nullable: false, api_name: "weeksActive"

      field :months_active, -> { Integer }, optional: false, nullable: false, api_name: "monthsActive"

      field :most_active_day, -> { Trophy::Types::WrappedMostActiveDay }, optional: false, nullable: false, api_name: "mostActiveDay"

      field :most_active_week, -> { Trophy::Types::WrappedMostActiveWeek }, optional: false, nullable: false, api_name: "mostActiveWeek"

      field :most_active_month, -> { Trophy::Types::WrappedMostActiveMonth }, optional: false, nullable: false, api_name: "mostActiveMonth"

      field :entire_year, -> { Trophy::Types::WrappedEntireYear }, optional: false, nullable: false, api_name: "entireYear"
    end
  end
end
