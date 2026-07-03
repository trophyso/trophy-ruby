# frozen_string_literal: true

module Trophy
  module Admin
    module Leaderboards
      module Types
        class LeaderboardsListRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false

          field :skip, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
