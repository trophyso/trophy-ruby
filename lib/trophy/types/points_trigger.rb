# frozen_string_literal: true

module Trophy
  module Types
    class PointsTrigger < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { Trophy::Types::PointsTriggerType }, optional: false, nullable: false

      field :points, -> { Integer }, optional: false, nullable: false

      field :status, -> { Trophy::Types::PointsTriggerStatus }, optional: false, nullable: false

      field :achievement_id, -> { String }, optional: true, nullable: false, api_name: "achievementId"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_name, -> { String }, optional: true, nullable: false, api_name: "metricName"

      field :metric_threshold, -> { Integer }, optional: true, nullable: false, api_name: "metricThreshold"

      field :streak_length_threshold, -> { Integer }, optional: true, nullable: false, api_name: "streakLengthThreshold"

      field :achievement_name, -> { String }, optional: true, nullable: false, api_name: "achievementName"

      field :time_unit, -> { Trophy::Types::PointsTriggerTimeUnit }, optional: true, nullable: false, api_name: "timeUnit"

      field :time_interval, -> { Integer }, optional: true, nullable: false, api_name: "timeInterval"

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::PointsTriggerUserAttributesItem] }, optional: false, nullable: false, api_name: "userAttributes"

      field :event_attribute, -> { Trophy::Types::PointsTriggerEventAttribute }, optional: true, nullable: false, api_name: "eventAttribute"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::PointsTriggerEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :created, -> { String }, optional: false, nullable: false

      field :updated, -> { String }, optional: false, nullable: false
    end
  end
end
