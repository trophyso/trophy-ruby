# frozen_string_literal: true

module Trophy
  module Types
    module AdminIssueSeverity
      extend Trophy::Internal::Types::Enum

      ERROR = "error"
      WARNING = "warning"
    end
  end
end
