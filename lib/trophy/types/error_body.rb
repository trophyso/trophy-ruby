# frozen_string_literal: true

module Trophy
  module Types
    class ErrorBody < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
