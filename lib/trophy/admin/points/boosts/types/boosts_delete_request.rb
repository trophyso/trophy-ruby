# frozen_string_literal: true

module Trophy
  module Admin
    module Points
      module Boosts
        module Types
          class BoostsDeleteRequest < Internal::Types::Model
            field :system_id, -> { String }, optional: false, nullable: false, api_name: "systemId"

            field :ids, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
