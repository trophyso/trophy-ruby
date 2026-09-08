# frozen_string_literal: true

module Trophy
  module Types
    # An active environment in the organisation.
    class AdminEnvironment < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :key, -> { String }, optional: false, nullable: false

      field :priority, -> { Integer }, optional: false, nullable: false
    end
  end
end
