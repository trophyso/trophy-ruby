# frozen_string_literal: true

module Trophy
  module Types
    class BulkStreakResponseItem < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"

      field :streak_length, -> { Integer }, optional: false, nullable: false, api_name: "streakLength"

      field :extended, -> { String }, optional: true, nullable: false
    end
  end
end
