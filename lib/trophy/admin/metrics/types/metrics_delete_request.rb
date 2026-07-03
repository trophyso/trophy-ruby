# frozen_string_literal: true

module Trophy
  module Admin
    module Metrics
      module Types
        class MetricsDeleteRequest < Internal::Types::Model
          field :ids, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
