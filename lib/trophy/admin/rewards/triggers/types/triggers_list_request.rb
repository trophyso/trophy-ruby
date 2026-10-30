# frozen_string_literal: true

module Trophy
  module Admin
    module Rewards
      module Triggers
        module Types
          class TriggersListRequest < Internal::Types::Model
            field :reward_id, -> { String }, optional: false, nullable: false, api_name: "rewardId"

            field :limit, -> { Integer }, optional: true, nullable: false

            field :skip, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
