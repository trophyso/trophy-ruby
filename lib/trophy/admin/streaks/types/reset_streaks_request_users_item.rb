# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Types
        class ResetStreaksRequestUsersItem < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
