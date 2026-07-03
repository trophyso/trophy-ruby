# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Freezes
        module Types
          class CreateStreakFreezesRequest < Internal::Types::Model
            field :freezes, -> { Internal::Types::Array[Trophy::Admin::Streaks::Freezes::Types::CreateStreakFreezesRequestFreezesItem] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
