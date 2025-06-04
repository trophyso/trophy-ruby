# Trophy Ruby SDK

The Trophy Ruby SDK provides convenient access to the Trophy API from applications written in the
Ruby language.

Trophy provides APIs and tools for adding gamification to your application, keeping users engaged
through rewards, achievements, streaks, and personalized communication.

## Installation

You don't need this source code unless you want to modify the gem. If you just want to use the
package, just run:

```bash
gem install trophy_api_client
```

If you want to build the gem from source:

```bash
gem build trophy_api_client.gemspec
```

## Usage

The package needs to be configured with your account's API key which is available in the Trophy
dashboard.

```ruby
require 'trophy_api_client'
include TrophyApiClient

client = TrophyApiClient::Client.new(
  api_key: 'YOUR_API_KEY'
)

result = client.metrics.event(
  :key => 'words-written',
  :user => {
    :id => '18',
    :email => 'jk.rowling@harrypotter.com'
  },
  :value => 750
)
```

## Documentation

See the [Trophy API Docs](https://docs.trophy.so) for more
information on the accessible endpoints.
