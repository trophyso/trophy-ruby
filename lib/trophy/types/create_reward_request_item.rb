# frozen_string_literal: true

module Trophy
  module Types
    # A reward to create. Optionally include triggers.
    class CreateRewardRequestItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :status, -> { Trophy::Types::CreateRewardRequestItemStatus }, optional: true, nullable: false

      field :type, -> { Trophy::Types::CreateRewardRequestItemType }, optional: false, nullable: false

      field :points_system_id, -> { String }, optional: true, nullable: false, api_name: "pointsSystemId"

      field :points, -> { Integer }, optional: true, nullable: false

      field :max_redemptions, -> { Integer }, optional: true, nullable: false, api_name: "maxRedemptions"

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::CreateRewardRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"

      field :triggers, -> { Internal::Types::Array[Trophy::Types::CreateRewardTriggerRequestItem] }, optional: true, nullable: false
    end
  end
end
