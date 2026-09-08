# frozen_string_literal: true

module Trophy
  module Types
    # An achievement update object. `id` is required; all other fields are optional. Omitted fields are preserved. Send
    # `null` for `description`, `badge`, or `userAttributes` to clear them.
    class UpdateAchievementRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :trigger, -> { Trophy::Types::UpdateAchievementRequestItemTrigger }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :status, -> { Trophy::Types::UpdateAchievementRequestItemStatus }, optional: true, nullable: false

      field :badge, -> { Trophy::Types::UpdateAchievementRequestItemBadge }, optional: true, nullable: false

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::UpdateAchievementRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"

      field :key, -> { String }, optional: true, nullable: false

      field :metric_id, -> { String }, optional: true, nullable: false, api_name: "metricId"

      field :metric_value, -> { Integer }, optional: true, nullable: false, api_name: "metricValue"

      field :event_attributes, -> { Internal::Types::Array[Trophy::Types::UpdateAchievementRequestItemEventAttributesItem] }, optional: true, nullable: false, api_name: "eventAttributes"

      field :streak_length, -> { Integer }, optional: true, nullable: false, api_name: "streakLength"

      field :anniversary_years, -> { Integer }, optional: true, nullable: false, api_name: "anniversaryYears"

      field :achievement_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "achievementIds"
    end
  end
end
