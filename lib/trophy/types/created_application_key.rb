# frozen_string_literal: true

module Trophy
  module Types
    # A newly created application API key.
    class CreatedApplicationKey < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"

      field :key, -> { String }, optional: false, nullable: false

      field :prefix, -> { String }, optional: false, nullable: false
    end
  end
end
