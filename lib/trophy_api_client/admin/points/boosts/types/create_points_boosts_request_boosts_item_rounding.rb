# frozen_string_literal: true

module TrophyApiClient
  module Admin
    module Points
      class Boosts
        # How to round the boosted points. Defaults to 'down'.
        class CreatePointsBoostsRequestBoostsItemRounding
          DOWN = "down"
          UP = "up"
          NEAREST = "nearest"
        end
      end
    end
  end
end
