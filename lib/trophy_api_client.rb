# frozen_string_literal: true

require_relative "trophy"

# The published gem name stays trophy_api_client. Fern now generates the
# Trophy module, so the old require path points at that module.
TrophyApiClient = Trophy
