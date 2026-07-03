# frozen_string_literal: true

module Trophy
  module Admin
    module Points
      module Systems
        module Types
          class SystemsDeleteRequest < Internal::Types::Model
            field :ids, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
