# Trophy Ruby SDK

The Trophy Ruby SDK provides convenient access to the Trophy API from applications written in the
Ruby language.

Trophy is the 1:1 customer engagement platform for consumer web and mobile apps. AI lifecycle
marketing agents write and send personalized email and push to every user, alongside in-app
experiences like milestones, streaks, points, and leaderboards. This library gives your app access
to the Trophy API, so you can send the user events that power both.

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
