# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Pauses
        module Types
          class PausesDeleteRequest < Internal::Types::Model
            field :ids, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
