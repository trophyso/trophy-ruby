# frozen_string_literal: true

module Trophy
  module Types
    class AdminPointsSystemBadge < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
