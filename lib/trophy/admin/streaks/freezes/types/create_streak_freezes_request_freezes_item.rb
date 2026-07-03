# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Freezes
        module Types
          class CreateStreakFreezesRequestFreezesItem < Internal::Types::Model
            field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"
          end
        end
      end
    end
  end
end
