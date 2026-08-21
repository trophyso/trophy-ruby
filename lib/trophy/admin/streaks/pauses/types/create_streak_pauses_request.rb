# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Pauses
        module Types
          class CreateStreakPausesRequest < Internal::Types::Model
            field :pauses, -> { Internal::Types::Array[Trophy::Admin::Streaks::Pauses::Types::CreateStreakPausesRequestPausesItem] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
