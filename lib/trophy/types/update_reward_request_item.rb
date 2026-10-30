# frozen_string_literal: true

module Trophy
  module Types
    # A reward update object. Only id is required; all other fields are optional. Triggers are updated through the
    # reward triggers endpoints.
    class UpdateRewardRequestItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :status, -> { Trophy::Types::UpdateRewardRequestItemStatus }, optional: true, nullable: false

      field :type, -> { Trophy::Types::UpdateRewardRequestItemType }, optional: true, nullable: false

      field :points_system_id, -> { String }, optional: true, nullable: false, api_name: "pointsSystemId"

      field :points, -> { Integer }, optional: true, nullable: false

      field :max_redemptions, -> { Integer }, optional: true, nullable: false, api_name: "maxRedemptions"

      field :user_attributes, -> { Internal::Types::Array[Trophy::Types::UpdateRewardRequestItemUserAttributesItem] }, optional: true, nullable: false, api_name: "userAttributes"
    end
  end
end
