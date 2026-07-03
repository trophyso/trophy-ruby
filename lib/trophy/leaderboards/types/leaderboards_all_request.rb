# frozen_string_literal: true

module Trophy
  module Leaderboards
    module Types
      class LeaderboardsAllRequest < Internal::Types::Model
        field :include_finished, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeFinished"
      end
    end
  end
end
