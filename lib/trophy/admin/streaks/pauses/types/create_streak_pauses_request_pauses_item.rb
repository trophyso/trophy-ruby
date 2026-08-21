# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Pauses
        module Types
          class CreateStreakPausesRequestPausesItem < Internal::Types::Model
            field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"

            field :start, -> { String }, optional: false, nullable: false

            field :end_, -> { String }, optional: false, nullable: false, api_name: "end"
          end
        end
      end
    end
  end
end
