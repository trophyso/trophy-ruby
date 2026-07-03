# frozen_string_literal: true

module Trophy
  module Streaks
    module Types
      class StreaksListRequest < Internal::Types::Model
        field :user_ids, -> { String }, optional: true, nullable: false, api_name: "userIds"
      end
    end
  end
end
