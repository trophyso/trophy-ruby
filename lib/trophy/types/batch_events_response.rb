# frozen_string_literal: true

module Trophy
  module Types
    # Response returned when a batch of metric events is accepted.
    class BatchEventsResponse < Internal::Types::Model
      field :accepted, -> { Integer }, optional: false, nullable: false
    end
  end
end
