# frozen_string_literal: true

module Trophy
  module Types
    # A streak pause returned from the admin pauses endpoints.
    class AdminStreakPause < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"

      field :start, -> { String }, optional: false, nullable: false

      field :end_, -> { String }, optional: false, nullable: false, api_name: "end"

      field :status, -> { Trophy::Types::AdminStreakPauseStatus }, optional: false, nullable: false
    end
  end
end
