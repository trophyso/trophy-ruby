# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Types
        class ResetStreaksRequest < Internal::Types::Model
          field :users, -> { Internal::Types::Array[Trophy::Admin::Streaks::Types::ResetStreaksRequestUsersItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
