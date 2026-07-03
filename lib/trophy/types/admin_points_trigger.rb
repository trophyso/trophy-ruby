# frozen_string_literal: true

module Trophy
  module Types
    # A points trigger as returned from admin endpoints.
    class AdminPointsTrigger < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { Trophy::Types::AdminPointsTriggerType }, optional: false, nullable: false

      field :points, -> { Integer }, optional: false, nullable: false

      field :status, -> { Trophy::Types::AdminPointsTriggerStatus }, optional: false, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::AdminPointsTriggerUserAttributesItem] }, optional: false, nullable: false, api_name: "userAttributes"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_threshold, -> { Integer }, optional: true, nullable: false, api_name: "metricThreshold"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::AdminPointsTriggerEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :achievement_id, -> { String }, optional: true, nullable: false, api_name: "achievementId"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :time_unit, -> { Trophy::Types::AdminPointsTriggerTimeUnit }, optional: true, nullable: false, api_name: "timeUnit"

      field :time_interval, -> { Integer }, optional: true, nullable: false, api_name: "timeInterval"

      field :block_if_out_of_points, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "blockIfOutOfPoints"
    end
  end
end
