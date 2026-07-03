# frozen_string_literal: true

module Trophy
  module Internal
    module Types
      module Unknown
        include Trophy::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
