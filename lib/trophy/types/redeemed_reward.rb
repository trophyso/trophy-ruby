# frozen_string_literal: true

module Trophy
  module Types
    class RedeemedReward < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :awarded_at, -> { String }, optional: false, nullable: false, api_name: "awardedAt"

      field :redeemed_at, -> { String }, optional: false, nullable: false, api_name: "redeemedAt"
    end
  end
end
