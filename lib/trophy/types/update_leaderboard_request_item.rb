# frozen_string_literal: true

module Trophy
  module Types
    # A leaderboard update object. `id` is required. Once a leaderboard has been activated, the dashboard-imposed
    # restrictions on ranking configuration and scheduling changes still apply.
    class UpdateLeaderboardRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :key, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :status, -> { Trophy::Types::UpdateLeaderboardRequestItemStatus }, optional: true, nullable: false

      field :rank_by, -> { Trophy::Types::UpdateLeaderboardRequestItemRankBy }, optional: true, nullable: false, api_name: "rankBy"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :points_system_id, -> { String }, optional: true, nullable: false, api_name: "pointsSystemId"

      field :max_participants, -> { Integer }, optional: true, nullable: false, api_name: "maxParticipants"

      field :start, -> { String }, optional: true, nullable: false

      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :start_time, -> { String }, optional: true, nullable: false, api_name: "startTime"

      field :end_time, -> { String }, optional: true, nullable: false, api_name: "endTime"

      field :breakdown_attributes, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "breakdownAttributes"

      field :run_unit, -> { Trophy::Types::UpdateLeaderboardRequestItemRunUnit }, optional: true, nullable: false, api_name: "runUnit"

      field :run_interval, -> { Integer }, optional: true, nullable: false, api_name: "runInterval"
    end
  end
end
