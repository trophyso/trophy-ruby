# frozen_string_literal: true

module Trophy
  module Admin
    module Streaks
      module Types
        class RestoreStreaksRequest < Internal::Types::Model
          field :users, -> { Internal::Types::Array[Trophy::Admin::Streaks::Types::RestoreStreaksRequestUsersItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
