# frozen_string_literal: true

module Trophy
  module Admin
    module Leaderboards
      module Types
        class LeaderboardsDeleteRequest < Internal::Types::Model
          field :ids, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
