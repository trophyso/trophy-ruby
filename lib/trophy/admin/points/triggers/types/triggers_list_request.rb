# frozen_string_literal: true

module Trophy
  module Admin
    module Points
      module Triggers
        module Types
          class TriggersListRequest < Internal::Types::Model
            field :system_id, -> { String }, optional: false, nullable: false, api_name: "systemId"

            field :limit, -> { Integer }, optional: true, nullable: false

            field :skip, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
