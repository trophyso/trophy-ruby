# frozen_string_literal: true

module Trophy
  module Admin
    module Rewards
      module Types
        class RewardsDeleteRequest < Internal::Types::Model
          field :ids, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
