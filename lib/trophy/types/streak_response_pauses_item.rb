# frozen_string_literal: true

module Trophy
  module Types
    # An object representing a streak pause.
    class StreakResponsePausesItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: false, nullable: false, api_name: "end"
    end
  end
end
