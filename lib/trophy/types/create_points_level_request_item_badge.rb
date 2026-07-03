# frozen_string_literal: true

module Trophy
  module Types
    # An optional badge for the level.
    class CreatePointsLevelRequestItemBadge < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
