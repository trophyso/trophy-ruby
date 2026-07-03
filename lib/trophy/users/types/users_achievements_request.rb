# frozen_string_literal: true

module Trophy
  module Users
    module Types
      class UsersAchievementsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :include_incomplete, -> { String }, optional: true, nullable: false, api_name: "includeIncomplete"
      end
    end
  end
end
