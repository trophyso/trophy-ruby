# frozen_string_literal: true

module Trophy
  module Types
    # A points trigger to create.
    class CreatePointsTriggerRequestItem < Internal::Types::Model
      field :type, -> { Trophy::Types::CreatePointsTriggerRequestItemType }, optional: false, nullable: false

      field :points, -> { Integer }, optional: false, nullable: false

      field :status, -> { Trophy::Types::CreatePointsTriggerRequestItemStatus }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::CreatePointsTriggerRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_threshold, -> { Integer }, optional: true, nullable: false, api_name: "metricThreshold"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::CreatePointsTriggerRequestItemEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :achievement_id, -> { String }, optional: true, nullable: false, api_name: "achievementId"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :time_unit, -> { Trophy::Types::CreatePointsTriggerRequestItemTimeUnit }, optional: true, nullable: false, api_name: "timeUnit"

      field :time_interval, -> { Integer }, optional: true, nullable: false, api_name: "timeInterval"

      field :block_if_out_of_points, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "blockIfOutOfPoints"
    end
  end
end
