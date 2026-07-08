# frozen_string_literal: true

module Trophy
  module Types
    class MetricEventLeaderboardResponse < Internal::Types::Model
      field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

      field :rank, -> { Integer }, optional: true, nullable: false

      field :previous_rank, -> { Integer }, optional: true, nullable: false, api_name: "previousRank"

      field :threshold, -> { Integer }, optional: false, nullable: false

      field :breakdown_attribute_value, -> { String }, optional: true, nullable: false, api_name: "breakdownAttributeValue"

      field :breakdown_attribute_values, -> { Internal::Types::Array[Trophy::Types::MetricEventLeaderboardResponseBreakdownAttributeValuesItem] }, optional: true, nullable: false, api_name: "breakdownAttributeValues"

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

      field :start_time, -> { String }, optional: true, nullable: false, api_name: "startTime"

      field :end_time, -> { String }, optional: true, nullable: false, api_name: "endTime"

      field :max_participants, -> { Integer }, optional: true, nullable: false, api_name: "maxParticipants"

      field :run_unit, -> { Trophy::Types::LeaderboardResponseRunUnit }, optional: true, nullable: false, api_name: "runUnit"

      field :run_interval, -> { Integer }, optional: true, nullable: false, api_name: "runInterval"
    end
  end
end
