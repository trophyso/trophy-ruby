# Reference
## Achievements
<details><summary><code>client.achievements.<a href="/lib/trophy/achievements/client.rb">all</a>() -> Internal::Types::Array[Trophy::Types::AchievementWithStatsResponse]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all achievements and their completion stats.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.achievements.all(user_attributes: "plan-type:premium,region:us-east")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_attributes:** `String` — Optional colon-delimited user attributes in the format attribute:value,attribute:value. Only achievements accessible to a user with the provided attributes will be returned.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Achievements::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.achievements.<a href="/lib/trophy/achievements/client.rb">complete</a>(key, request) -> Trophy::Types::AchievementCompletionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mark an achievement as completed for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.achievements.complete(
  key: "finish-onboarding",
  user: {
    email: "user@example.com",
    tz: "Europe/London",
    id: "user-id"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Unique reference of the achievement as set when created.
    
</dd>
</dl>

<dl>
<dd>

**user:** `Trophy::Types::UpsertedUser` — The user that completed the achievement.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Achievements::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Metrics
<details><summary><code>client.metrics.<a href="/lib/trophy/metrics/client.rb">event</a>(key, request) -> Trophy::Types::EventResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Increment or decrement the value of a metric for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.metrics.event(
  key: "words-written",
  idempotency_key: "e4296e4b-8493-4bd1-9c30-5a1a9ac4d78f",
  user: {
    email: "user@example.com",
    tz: "Europe/London",
    attributes: {
      department: "engineering",
      role: "developer"
    },
    id: "18"
  },
  value: 750,
  attributes: {
    category: "writing",
    source: "mobile-app"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Unique reference of the metric as set when created.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — The idempotency key for the event.
    
</dd>
</dl>

<dl>
<dd>

**user:** `Trophy::Types::UpsertedUser` — The user that triggered the event.
    
</dd>
</dl>

<dl>
<dd>

**value:** `Integer` — The value to add to the user's current total for the given metric.
    
</dd>
</dl>

<dl>
<dd>

**attributes:** `Internal::Types::Hash[String, String]` — Event attributes as key-value pairs. Keys must match existing event attributes set up in the Trophy dashboard.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users
<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">create</a>(request) -> Trophy::Types::User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.create(id: "user-id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Trophy::Types::UpsertedUser` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">get</a>(id) -> Trophy::Types::User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.get(id: "userId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to get.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">identify</a>(id, request) -> Trophy::Types::User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Identify a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.identify(
  id: "id",
  email: "user@example.com",
  tz: "Europe/London",
  attributes: {
    department: "engineering",
    role: "developer"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to identify.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Trophy::Types::UpdatedUser` — The user object.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">update</a>(id, request) -> Trophy::Types::User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.update(
  id: "id",
  email: "user@example.com",
  tz: "Europe/London",
  attributes: {
    department: "engineering",
    role: "developer"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Trophy::Types::UpdatedUser` — The user object.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">get_preferences</a>(id) -> Trophy::Types::UserPreferencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's notification preferences.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.get_preferences(id: "user-123")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">update_preferences</a>(id, request) -> Trophy::Types::UserPreferencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a user's notification and streak preferences. Streak preferences require streak customization to be enabled in your Trophy dashboard settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.update_preferences(
  id: "user-123",
  notifications: {
    streak_reminder: ["email"]
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**notifications:** `Trophy::Types::NotificationPreferences` 
    
</dd>
</dl>

<dl>
<dd>

**streak:** `Trophy::Types::StreakPreferences` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">all_metrics</a>(id) -> Internal::Types::Array[Trophy::Types::MetricResponse]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single user's progress against all active metrics.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.all_metrics(id: "userId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">single_metric</a>(id, key) -> Trophy::Types::MetricResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's progress against a single active metric.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.single_metric(
  id: "userId",
  key: "key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Unique key of the metric.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">metric_event_summary</a>(id, key) -> Internal::Types::Array[Trophy::Users::Types::UsersMetricEventSummaryResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a summary of metric events over time for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.metric_event_summary(
  id: "userId",
  key: "words-written",
  aggregation: "daily",
  start_date: "2024-01-01",
  end_date: "2024-01-31"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Unique key of the metric.
    
</dd>
</dl>

<dl>
<dd>

**aggregation:** `Trophy::Users::Types::UsersMetricEventSummaryRequestAggregation` — The time period over which to aggregate the event data.
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The start date for the data range in YYYY-MM-DD format. The startDate must be before the endDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end date for the data range in YYYY-MM-DD format. The endDate must be after the startDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">achievements</a>(id) -> Internal::Types::Array[Trophy::Types::UserAchievementWithStatsResponse]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's achievements.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.achievements(
  id: "userId",
  include_incomplete: "true"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**include_incomplete:** `String` — When set to 'true', returns both completed and incomplete achievements for the user. When omitted or set to any other value, returns only completed achievements.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">streak</a>(id) -> Trophy::Types::StreakResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's streak data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.streak(
  id: "userId",
  history_periods: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**history_periods:** `Integer` — The number of past streak periods to include in the streakHistory field of the  response.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">points</a>(id, key) -> Trophy::Types::GetUserPointsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's points for a specific points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.points(
  id: "userId",
  key: "points-system-key",
  awards: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**awards:** `Integer` — The number of recent point awards to return.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">points_boosts</a>(id, key) -> Internal::Types::Array[Trophy::Types::PointsBoost]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get active points boosts for a user in a specific points system. Returns both global boosts the user is eligible for and user-specific boosts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.points_boosts(
  id: "userId",
  key: "points-system-key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">points_event_summary</a>(id, key) -> Internal::Types::Array[Trophy::Users::Types::UsersPointsEventSummaryResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a summary of points awards over time for a user for a specific points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.points_event_summary(
  id: "userId",
  key: "points-system-key",
  aggregation: "daily",
  start_date: "2024-01-01",
  end_date: "2024-01-31"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the user.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**aggregation:** `Trophy::Users::Types::UsersPointsEventSummaryRequestAggregation` — The time period over which to aggregate the event data.
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The start date for the data range in YYYY-MM-DD format. The startDate must be before the endDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end date for the data range in YYYY-MM-DD format. The endDate must be after the startDate, and the date range must not exceed 400 days.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">leaderboard</a>(id, key) -> Trophy::Types::UserLeaderboardResponseWithHistory</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's rank, value, and daily ranking history for a specific leaderboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.leaderboard(
  id: "user-123",
  key: "weekly-words",
  run: "2025-01-15",
  num_events: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` — Unique key of the leaderboard as set when created.
    
</dd>
</dl>

<dl>
<dd>

**run:** `String` — Specific run date in YYYY-MM-DD format. If not provided, returns the current run.
    
</dd>
</dl>

<dl>
<dd>

**num_events:** `Integer` — The number of days to return in the leaderboard history for the user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/trophy/users/client.rb">wrapped</a>(id) -> Trophy::Types::WrappedResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a user's year-in-review wrapped data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.wrapped(
  id: "user-123",
  year: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user's ID in your database.
    
</dd>
</dl>

<dl>
<dd>

**year:** `Integer` — The year to get wrapped data for. Defaults to the current year. Must be an integer between 1 and the current year.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Streaks
<details><summary><code>client.streaks.<a href="/lib/trophy/streaks/client.rb">list</a>() -> Internal::Types::Array[Trophy::Types::BulkStreakResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the streak lengths of a list of users, ranked by streak length from longest to shortest.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.streaks.list(user_ids: ["userIds"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_ids:** `String` — A list of up to 100 user IDs.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Streaks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Points
<details><summary><code>client.points.<a href="/lib/trophy/points/client.rb">summary</a>(key) -> Internal::Types::Array[Trophy::Types::PointsRange]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a breakdown of the number of users with points in each range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.points.summary(
  key: "points-system-key",
  user_attributes: "plan-type:premium,region:us-east"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**user_attributes:** `String` — Optional colon-delimited user attribute filters in the format attribute:value,attribute:value. Only users matching ALL specified attributes will be included in the points breakdown.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Points::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/lib/trophy/points/client.rb">system</a>(key) -> Trophy::Types::PointsSystemResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a points system with its triggers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.points.system(key: "points-system-key")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Points::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/lib/trophy/points/client.rb">boosts</a>(key) -> Internal::Types::Array[Trophy::Types::PointsBoost]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all global boosts for a points system. Finished boosts are excluded by default.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.points.boosts(
  key: "points-system-key",
  include_finished: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**include_finished:** `Internal::Types::Boolean` — When set to 'true', boosts that have finished (past their end date) will be included in the response. By default, finished boosts are excluded.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Points::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/lib/trophy/points/client.rb">levels</a>(key) -> Internal::Types::Array[Trophy::Types::PointsLevel]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all levels for a points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.points.levels(key: "points-system-key")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Points::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.points.<a href="/lib/trophy/points/client.rb">level_summary</a>(key) -> Internal::Types::Array[Trophy::Types::PointsLevelSummaryResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a breakdown of the number of users at each level in a points system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.points.level_summary(key: "points-system-key")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Key of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Points::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Leaderboards
<details><summary><code>client.leaderboards.<a href="/lib/trophy/leaderboards/client.rb">all</a>() -> Internal::Types::Array[Trophy::Leaderboards::Types::LeaderboardsAllResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all leaderboards for your organization. Finished leaderboards are excluded by default.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.leaderboards.all(include_finished: true)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**include_finished:** `Internal::Types::Boolean` — When set to 'true', leaderboards with status 'finished' will be included in the response. By default, finished leaderboards are excluded.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Leaderboards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.leaderboards.<a href="/lib/trophy/leaderboards/client.rb">get</a>(key) -> Trophy::Types::LeaderboardResponseWithRankings</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a specific leaderboard by its key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.leaderboards.get(
  key: "weekly-words",
  offset: 1,
  limit: 1,
  run: "2025-01-15",
  user_id: "user-123",
  user_attributes: "city:London"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — Unique key of the leaderboard as set when created.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — Number of rankings to skip for pagination.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Maximum number of rankings to return. Cannot be greater than the size of the leaderboard.
    
</dd>
</dl>

<dl>
<dd>

**run:** `String` — Specific run date in YYYY-MM-DD format. If not provided, returns the current run.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — When provided, offset is relative to this user's position on the leaderboard. If the user is not found in the leaderboard, returns empty rankings array.
    
</dd>
</dl>

<dl>
<dd>

**user_attributes:** `String` — Attribute key and value to filter the rankings by, separated by a colon. For example, `city:London`. This parameter is required, and only valid for leaderboards with a breakdown attribute.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Leaderboards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Attributes
<details><summary><code>client.admin.attributes.<a href="/lib/trophy/admin/attributes/client.rb">list</a>() -> Internal::Types::Array[Trophy::Types::AdminAttribute]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List attributes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.attributes.list(
  limit: 1,
  skip: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Attributes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/lib/trophy/admin/attributes/client.rb">create</a>(request) -> Trophy::Types::CreateAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create attributes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.attributes.create(request: [{
  name: "Plan",
  key: "plan",
  type: "user"
}, {
  name: "Device",
  key: "device",
  type: "event"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreateAttributeRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Attributes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/lib/trophy/admin/attributes/client.rb">delete</a>() -> Trophy::Types::DeleteAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete attributes by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.attributes.delete(ids: %w[550e8400-e29b-41d4-a716-446655440000 550e8400-e29b-41d4-a716-446655440001])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `String` — Attribute IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Attributes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/lib/trophy/admin/attributes/client.rb">update</a>(request) -> Trophy::Types::UpdateAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update attributes by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.attributes.update(request: [{
  id: "550e8400-e29b-41d4-a716-446655440000",
  name: "Subscription Plan"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::UpdateAttributeRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Attributes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.attributes.<a href="/lib/trophy/admin/attributes/client.rb">get</a>(id) -> Trophy::Types::AdminAttribute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get an attribute by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.attributes.get(id: "550e8400-e29b-41d4-a716-446655440000")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the attribute to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Attributes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Metrics
<details><summary><code>client.admin.metrics.<a href="/lib/trophy/admin/metrics/client.rb">list</a>() -> Internal::Types::Array[Trophy::Types::CreatedMetric]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List metrics.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.metrics.list(
  limit: 1,
  skip: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/lib/trophy/admin/metrics/client.rb">create</a>(request) -> Trophy::Types::CreateMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create metrics.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.metrics.create(request: [{
  name: "Invites Sent",
  key: "invites-sent"
}, {
  name: "Revenue",
  key: "revenue",
  unit_type: "currency",
  units: "USD"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreateMetricRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/lib/trophy/admin/metrics/client.rb">delete</a>() -> Trophy::Types::DeleteMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete metrics by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.metrics.delete(ids: %w[550e8400-e29b-41d4-a716-446655440000 550e8400-e29b-41d4-a716-446655440001])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `String` — Metric IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/lib/trophy/admin/metrics/client.rb">update</a>(request) -> Trophy::Types::UpdateMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update metrics by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.metrics.update(request: [{
  id: "550e8400-e29b-41d4-a716-446655440000",
  name: "Invites Completed",
  units: "invites"
}, {
  id: "550e8400-e29b-41d4-a716-446655440001",
  unit_type: "number",
  units: "dollars"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::UpdateMetricRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/lib/trophy/admin/metrics/client.rb">get</a>(id) -> Trophy::Types::CreatedMetric</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a metric by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.metrics.get(id: "550e8400-e29b-41d4-a716-446655440000")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the metric to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.metrics.<a href="/lib/trophy/admin/metrics/client.rb">batch_events</a>(request) -> Trophy::Types::BatchEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit up to 1,000 metric events for asynchronous processing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.metrics.batch_events(request: [{
  key: "words-written",
  user: {
    id: "18",
    email: "user@example.com",
    tz: "Europe/London",
    attributes: {
      department: "engineering",
      role: "developer"
    }
  },
  value: 750,
  attributes: {
    category: "writing",
    source: "mobile-app"
  },
  idempotency_key: "e4296e4b-8493-4bd1-9c30-5a1a9ac4d78f"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::BatchMetricEvent]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Leaderboards
<details><summary><code>client.admin.leaderboards.<a href="/lib/trophy/admin/leaderboards/client.rb">list</a>() -> Internal::Types::Array[Trophy::Types::AdminLeaderboard]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List leaderboards.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.leaderboards.all
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Leaderboards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/lib/trophy/admin/leaderboards/client.rb">create</a>(request) -> Trophy::Types::CreateLeaderboardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create leaderboards. Maximum 100 leaderboards per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.leaderboards.create(request: [{
  name: "Revenue Champions",
  key: "revenue-champions",
  status: "inactive",
  rank_by: "metric",
  metric_id: "550e8400-e29b-41d4-a716-446655440000",
  max_participants: 100,
  start: "2026-04-20",
  breakdown_attributes: ["550e8400-e29b-41d4-a716-446655440010"],
  run_unit: "month",
  run_interval: 1
}, {
  name: "Streak Legends",
  key: "streak-legends",
  status: "scheduled",
  rank_by: "streak",
  start: "2026-04-27"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreateLeaderboardRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Leaderboards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/lib/trophy/admin/leaderboards/client.rb">delete</a>() -> Trophy::Types::DeleteLeaderboardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete leaderboards by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.leaderboards.delete(ids: ["ids"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `String` — Leaderboard IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Leaderboards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/lib/trophy/admin/leaderboards/client.rb">update</a>(request) -> Trophy::Types::UpdateLeaderboardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update leaderboards by ID. Updating `status` behaves the same as activating, scheduling, deactivating, or finishing a leaderboard in the dashboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.leaderboards.update(request: [{
  id: "550e8400-e29b-41d4-a716-446655440100",
  name: "Monthly Revenue Champions",
  description: "Ranked by monthly revenue",
  status: "active"
}, {
  id: "550e8400-e29b-41d4-a716-446655440101",
  status: "finished"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::UpdateLeaderboardRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Leaderboards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.leaderboards.<a href="/lib/trophy/admin/leaderboards/client.rb">get</a>(id) -> Trophy::Types::AdminLeaderboard</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a leaderboard by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.leaderboards.get(id: "550e8400-e29b-41d4-a716-446655440100")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the leaderboard to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Leaderboards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Streaks
<details><summary><code>client.admin.streaks.<a href="/lib/trophy/admin/streaks/client.rb">restore</a>(request) -> Trophy::Types::RestoreStreaksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Restore streaks for multiple users to the maximum previously achieved streak length found within the current restore window: the last 90 days for daily streaks, weekly periods starting with the week containing the start of the current calendar year for weekly streaks, and monthly periods starting at the beginning of the previous calendar year for monthly streaks.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.streaks.restore(users: [{
  id: "user-123"
}, {
  id: "user-456"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**users:** `Internal::Types::Array[Trophy::Admin::Streaks::Types::RestoreStreaksRequestUsersItem]` — Array of users to restore streaks for. Maximum 100 users per request.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Streaks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin ApplicationApiKeys
<details><summary><code>client.admin.application_api_keys.<a href="/lib/trophy/admin/application_api_keys/client.rb">create</a>(request) -> Trophy::Types::CreateApplicationKeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create application API keys scoped to specific users. Each key can only perform operations on behalf of the user it was created for.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.application_api_keys.create(request: [{
  user_id: "user_123"
}, {
  user_id: "user_456"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreateApplicationKeyRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::ApplicationApiKeys::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.application_api_keys.<a href="/lib/trophy/admin/application_api_keys/client.rb">delete</a>() -> Trophy::Types::DeleteApplicationKeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete application API keys by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.application_api_keys.delete(ids: ["550e8400-e29b-41d4-a716-446655440000"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `String` — Application API key IDs (UUIDs returned at creation time). Repeat the query param or provide a comma-separated list. Maximum 100 IDs per request.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::ApplicationApiKeys::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Tenants
<details><summary><code>client.admin.tenants.<a href="/lib/trophy/admin/tenants/client.rb">list</a>() -> Internal::Types::Array[Trophy::Types::AdminTenant]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List tenants in the current environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.tenants.list(
  limit: 1,
  skip: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Tenants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/lib/trophy/admin/tenants/client.rb">create</a>(request) -> Trophy::Types::CreateTenantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create tenants.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.tenants.create(request: [{
  customer_id: "customer_12345",
  name: "Acme Corp"
}, {
  customer_id: "customer_67890",
  name: "Globex Inc"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreateTenantRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Tenants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/lib/trophy/admin/tenants/client.rb">delete</a>() -> Trophy::Types::DeleteTenantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete tenants by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.tenants.delete(ids: %w[550e8400-e29b-41d4-a716-446655440000 550e8400-e29b-41d4-a716-446655440001])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `String` — Tenant IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Tenants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/lib/trophy/admin/tenants/client.rb">update</a>(request) -> Trophy::Types::UpdateTenantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update tenants by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.tenants.update(request: [{
  id: "550e8400-e29b-41d4-a716-446655440000",
  name: "Acme Corporation"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::UpdateTenantRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Tenants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.tenants.<a href="/lib/trophy/admin/tenants/client.rb">get</a>(id) -> Trophy::Types::AdminTenant</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a tenant by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.tenants.get(id: "550e8400-e29b-41d4-a716-446655440000")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID of the tenant to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Tenants::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Systems
<details><summary><code>client.admin.points.systems.<a href="/lib/trophy/admin/points/systems/client.rb">list</a>() -> Internal::Types::Array[Trophy::Types::AdminPointsSystem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points systems.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.systems.list(
  limit: 1,
  skip: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Systems::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/lib/trophy/admin/points/systems/client.rb">create</a>(request) -> Trophy::Types::CreatePointsSystemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points systems. Optionally include sub-entities (levels, boosts, triggers) in each system payload to create them alongside the system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.systems.create(request: [{
  name: "XP",
  key: "xp",
  description: "Experience points",
  levels: [{
    name: "Bronze",
    key: "bronze",
    points: 100
  }, {
    name: "Silver",
    key: "silver",
    points: 500
  }]
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreatePointsSystemRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Systems::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/lib/trophy/admin/points/systems/client.rb">delete</a>() -> Trophy::Types::DeletePointsSystemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete points systems by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.systems.delete(ids: ["550e8400-e29b-41d4-a716-446655440000"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `String` — The IDs of the points systems to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Systems::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/lib/trophy/admin/points/systems/client.rb">update</a>(request) -> Trophy::Types::UpdatePointsSystemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update points systems by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.systems.update(request: [{
  id: "550e8400-e29b-41d4-a716-446655440000",
  name: "New Name"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::UpdatePointsSystemRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Systems::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.systems.<a href="/lib/trophy/admin/points/systems/client.rb">get</a>(id) -> Trophy::Types::AdminPointsSystem</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a points system by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.systems.get(id: "550e8400-e29b-41d4-a716-446655440000")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Systems::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Boosts
<details><summary><code>client.admin.points.boosts.<a href="/lib/trophy/admin/points/boosts/client.rb">list</a>(system_id) -> Internal::Types::Array[Trophy::Types::AdminPointsBoost]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points boosts for a system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.boosts.list(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  limit: 1,
  skip: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Maximum number of results to return (1-100, default 10).
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of results to skip for pagination (default 0).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Boosts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/lib/trophy/admin/points/boosts/client.rb">create</a>(system_id, request) -> Trophy::Types::CreatePointsBoostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points boosts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.boosts.create(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  request: [{
    user_id: "user-123",
    name: "Double XP Weekend",
    start: "2024-01-01",
    end_: "2024-01-03",
    multiplier: 2
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreatePointsBoostRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Boosts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/lib/trophy/admin/points/boosts/client.rb">delete</a>(system_id) -> Trophy::Types::DeletePointsBoostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete multiple points boosts by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.boosts.delete(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  ids: ["ids"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**ids:** `String` — A list of up to 100 boost IDs.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Boosts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/lib/trophy/admin/points/boosts/client.rb">update</a>(system_id, request) -> Trophy::Types::PatchPointsBoostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update multiple points boosts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.boosts.update(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  request: [{
    id: "550e8400-e29b-41d4-a716-446655440000",
    name: "Updated Boost Name",
    multiplier: 3
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::PatchPointsBoostsRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Boosts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.boosts.<a href="/lib/trophy/admin/points/boosts/client.rb">get</a>(system_id, id) -> Trophy::Types::AdminPointsBoost</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single points boost by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.boosts.get(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  id: "660f9500-f30c-42e5-b827-557766550001"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The UUID of the points boost.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Boosts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Levels
<details><summary><code>client.admin.points.levels.<a href="/lib/trophy/admin/points/levels/client.rb">list</a>(system_id) -> Internal::Types::Array[Trophy::Types::AdminPointsLevel]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points levels for a system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.levels.list(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  limit: 1,
  skip: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Number of records to return.
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of records to skip from the start of the list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Levels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/lib/trophy/admin/points/levels/client.rb">create</a>(system_id, request) -> Trophy::Types::CreatePointsLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points levels. Maximum 100 levels per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.levels.create(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  request: [{
    name: "Bronze",
    key: "bronze",
    points: 100
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreatePointsLevelRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Levels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/lib/trophy/admin/points/levels/client.rb">delete</a>(system_id) -> Trophy::Types::DeletePointsLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete multiple points levels by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.levels.delete(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  ids: ["ids"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**ids:** `String` — Comma-separated list of level UUIDs to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Levels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/lib/trophy/admin/points/levels/client.rb">update</a>(system_id, request) -> Trophy::Types::PatchPointsLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update multiple points levels. Each item must include an ID. `key` cannot be changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.levels.update(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  request: [{
    id: "550e8400-e29b-41d4-a716-446655440000"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::PatchPointsLevelsRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Levels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.levels.<a href="/lib/trophy/admin/points/levels/client.rb">get</a>(system_id, id) -> Trophy::Types::AdminPointsLevel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single points level by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.levels.get(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  id: "660f9500-f30c-42e5-b827-557766550001"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The UUID of the points level.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Levels::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Points Triggers
<details><summary><code>client.admin.points.triggers.<a href="/lib/trophy/admin/points/triggers/client.rb">list</a>(system_id) -> Internal::Types::Array[Trophy::Types::AdminPointsTrigger]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List points triggers for a system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.triggers.list(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  limit: 1,
  skip: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Maximum number of results to return (1-100, default 10).
    
</dd>
</dl>

<dl>
<dd>

**skip:** `Integer` — Number of results to skip for pagination (default 0).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Triggers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/lib/trophy/admin/points/triggers/client.rb">create</a>(system_id, request) -> Trophy::Types::CreatePointsTriggersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create points triggers in bulk. Maximum 100 triggers per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.triggers.create(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  request: [{
    type: "metric",
    points: 10
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::CreatePointsTriggerRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Triggers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/lib/trophy/admin/points/triggers/client.rb">delete</a>(system_id) -> Trophy::Types::DeletePointsTriggersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete points triggers by ID. Maximum 100 trigger IDs per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.triggers.delete(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  ids: ["550e8400-e29b-41d4-a716-446655440000"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**ids:** `String` — Trigger IDs to delete. Can be repeated or comma-separated.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Triggers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/lib/trophy/admin/points/triggers/client.rb">update</a>(system_id, request) -> Trophy::Types::PatchPointsTriggersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update points triggers in bulk. Maximum 100 triggers per request. Only provided fields are updated; omitted fields are preserved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.triggers.update(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  request: [{
    id: "id"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Trophy::Types::PatchPointsTriggersRequestItem]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Triggers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.points.triggers.<a href="/lib/trophy/admin/points/triggers/client.rb">get</a>(system_id, id) -> Trophy::Types::AdminPointsTrigger</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get a single points trigger by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.points.triggers.get(
  system_id: "550e8400-e29b-41d4-a716-446655440000",
  id: "660f9500-f30c-42e5-b827-557766550001"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**system_id:** `String` — The UUID of the points system.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The UUID of the points trigger.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Points::Triggers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Streaks Freezes
<details><summary><code>client.admin.streaks.freezes.<a href="/lib/trophy/admin/streaks/freezes/client.rb">create</a>(request) -> Trophy::Types::CreateStreakFreezesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create streak freezes for multiple users.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.streaks.freezes.create(freezes: [{
  user_id: "user-123"
}, {
  user_id: "user-456"
}, {
  user_id: "user-123"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**freezes:** `Internal::Types::Array[Trophy::Admin::Streaks::Freezes::Types::CreateStreakFreezesRequestFreezesItem]` — Array of freezes to create. Maximum 100 freezes per request.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Streaks::Freezes::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Admin Streaks Pauses
<details><summary><code>client.admin.streaks.pauses.<a href="/lib/trophy/admin/streaks/pauses/client.rb">create</a>(request) -> Trophy::Types::CreateStreakPausesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create streak pauses for multiple users. A pause covers a specific date range and maintains the user's streak length during that range instead of ending the streak. Start dates in the past are rejected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.streaks.pauses.create(pauses: [{
  user_id: "user-123",
  start: "2026-08-20",
  end_: "2026-08-27"
}, {
  user_id: "user-456",
  start: "2026-09-01",
  end_: "2026-09-07"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**pauses:** `Internal::Types::Array[Trophy::Admin::Streaks::Pauses::Types::CreateStreakPausesRequestPausesItem]` — Array of pauses to create. Maximum 100 pauses per request.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Streaks::Pauses::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.admin.streaks.pauses.<a href="/lib/trophy/admin/streaks/pauses/client.rb">delete</a>() -> Trophy::Types::DeleteStreakPausesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete streak pauses by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.admin.streaks.pauses.delete(ids: %w[550e8400-e29b-41d4-a716-446655440000 550e8400-e29b-41d4-a716-446655440001])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `String` — Streak pause IDs to delete. Repeat the query param or provide a comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Trophy::Admin::Streaks::Pauses::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

