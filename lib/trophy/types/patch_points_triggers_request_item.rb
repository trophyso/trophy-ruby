# frozen_string_literal: true

module Trophy
  module Types
    class PatchPointsTriggersRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { Trophy::Types::PatchPointsTriggersRequestItemType }, optional: true, nullable: false

      field :points, -> { Integer }, optional: true, nullable: false

      field :status, -> { Trophy::Types::PatchPointsTriggersRequestItemStatus }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::PatchPointsTriggersRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_threshold, -> { Integer }, optional: true, nullable: false, api_name: "metricThreshold"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::PatchPointsTriggersRequestItemEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :achievement_id, -> { String }, optional: true, nullable: false, api_name: "achievementId"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :time_unit, -> { Trophy::Types::PatchPointsTriggersRequestItemTimeUnit }, optional: true, nullable: false, api_name: "timeUnit"

      field :time_interval, -> { Integer }, optional: true, nullable: false, api_name: "timeInterval"

      field :block_if_out_of_points, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "blockIfOutOfPoints"
    end
  end
end
