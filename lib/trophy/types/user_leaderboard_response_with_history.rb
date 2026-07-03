# frozen_string_literal: true

module Trophy
  module Types
    # A user's data for a specific leaderboard including rank, value, and history.
    class UserLeaderboardResponseWithHistory < Internal::Types::Model
      field :rank, -> { Integer }, optional: true, nullable: false

      field :value, -> { Integer }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :rank_by, -> { Trophy::Types::LeaderboardResponseRankBy }, optional: false, nullable: false, api_name: "rankBy"

      field :breakdown_attribute, -> { String }, optional: true, nullable: false, api_name: "breakdownAttribute"

      field :breakdown_attributes, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "breakdownAttributes"

      field :metric_key, -> { String }, optional: true, nullable: false, api_name: "metricKey"

      field :metric_name, -> { String }, optional: true, nullable: false, api_name: "metricName"

      field :points_system_key, -> { String }, optional: true, nullable: false, api_name: "pointsSystemKey"

      field :points_system_name, -> { String }, optional: true, nullable: false, api_name: "pointsSystemName"

      field :description, -> { String }, optional: true, nullable: false

      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :max_participants, -> { Integer }, optional: true, nullable: false, api_name: "maxParticipants"

      field :run_unit, -> { Trophy::Types::LeaderboardResponseRunUnit }, optional: true, nullable: false, api_name: "runUnit"

      field :run_interval, -> { Integer }, optional: true, nullable: false, api_name: "runInterval"

      field :history, -> { Internal::Types::Array[Trophy::Types::LeaderboardEvent] }, optional: false, nullable: false
    end
  end
end
