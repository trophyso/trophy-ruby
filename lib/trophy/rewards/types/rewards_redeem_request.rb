# frozen_string_literal: true

module Trophy
  module Rewards
    module Types
      class RewardsRedeemRequest < Internal::Types::Model
        field :key, -> { String }, optional: false, nullable: false

        field :user, -> { Trophy::Types::UpsertedUser }, optional: false, nullable: false
      end
    end
  end
end
