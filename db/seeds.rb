# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
events = [
  {
    id: '97d64e90-2c53-41cf-a6a5-af399f75ecc5',
    name: 'Connect.Tech 2023',
    description:
      'The largest multi-framework front-end conference in the USA. A three day event diving deep with experts from across the tech ecosystem.',
    timezone: 'America/New_York',
    start_at: DateTime.parse('October 24, 2023 08:00:00'),
    end_at: DateTime.parse('October 26, 2023 05:00:00'),
    venue_type: 'IN_PERSON',
    venue_name: 'Georgia World Congress Center',
    address: '285 Andrew Young International Blvd NW',
    country: 'USA',
    city: 'Atlanta',
    state_or_province: 'GA',
    postal_code: '30313',
    registration_start_at: DateTime.parse('May 1, 2023 08:00:00'),
    registration_end_at: DateTime.parse('September 15, 2023 23:59:59'),
    currency: 'USD',
    capacity: nil,
  },
  {
    id: '97d64e90-2c53-41cf-a6a5-af399f75ecc6',
    name: 'Connect.Tech 2024',
    description:
      'The largest multi-framework front-end conference in the USA. A three day event diving deep with experts from across the tech ecosystem.',
    timezone: 'America/New_York',
    start_at: DateTime.parse('October 24, 2024 08:00:00'),
    end_at: DateTime.parse('October 26, 2024 05:00:00'),
    venue_type: 'IN_PERSON',
    venue_name: 'Georgia World Congress Center',
    address: '285 Andrew Young International Blvd NW',
    country: 'USA',
    city: 'Atlanta',
    state_or_province: 'GA',
    postal_code: '30313',
    registration_start_at: DateTime.parse('May 1, 2024 08:00:00'),
    registration_end_at: DateTime.parse('September 15, 2024 23:59:59'),
    currency: 'USD',
    capacity: nil,
  },
  {
    id: '97d64e90-2c53-41cf-a6a5-af399f75ecc7',
    name: 'Connect.Tech 2025',
    description:
      'The largest multi-framework front-end conference in the USA. A three day event diving deep with experts from across the tech ecosystem.',
    timezone: 'America/New_York',
    start_at: DateTime.parse('October 24, 2025 08:00:00'),
    end_at: DateTime.parse('October 26, 2025 05:00:00'),
    venue_type: 'IN_PERSON',
    venue_name: 'Georgia World Congress Center',
    address: '285 Andrew Young International Blvd NW',
    country: 'USA',
    city: 'Atlanta',
    state_or_province: 'GA',
    postal_code: '30313',
    registration_start_at: DateTime.parse('May 1, 2025 08:00:00'),
    registration_end_at: DateTime.parse('September 15, 2025 23:59:59'),
    currency: 'USD',
    capacity: nil,
  },
  {
    id: '97d64e90-2c53-41cf-a6a5-af399f75ecc8',
    name: 'Connect.Tech 2026',
    description:
      'The largest multi-framework front-end conference in the USA. A three day event diving deep with experts from across the tech ecosystem.',
    timezone: 'America/New_York',
    start_at: DateTime.parse('October 24, 2026 08:00:00'),
    end_at: DateTime.parse('October 26, 2026 05:00:00'),
    venue_type: 'IN_PERSON',
    venue_name: 'Georgia World Congress Center',
    address: '285 Andrew Young International Blvd NW',
    country: 'USA',
    city: 'Atlanta',
    state_or_province: 'GA',
    postal_code: '30313',
    registration_start_at: DateTime.parse('May 1, 2026 08:00:00'),
    registration_end_at: DateTime.parse('September 15, 2026 23:59:59'),
    currency: 'USD',
    capacity: nil,
  },
  {
    id: '97d64e90-2c53-41cf-a6a5-af399f75ecc9',
    name: 'Connect.Tech 2027',
    description:
      'The largest multi-framework front-end conference in the USA. A three day event diving deep with experts from across the tech ecosystem.',
    timezone: 'America/New_York',
    start_at: DateTime.parse('October 24, 2027 08:00:00'),
    end_at: DateTime.parse('October 26, 2027 05:00:00'),
    venue_type: 'IN_PERSON',
    venue_name: 'Georgia World Congress Center',
    address: '285 Andrew Young International Blvd NW',
    country: 'USA',
    city: 'Atlanta',
    state_or_province: 'GA',
    postal_code: '30313',
    registration_start_at: DateTime.parse('May 1, 2027 08:00:00'),
    registration_end_at: DateTime.parse('September 15, 2027 23:59:59'),
    currency: 'USD',
    capacity: nil,
  },
  {
    id: '97d64e90-2c53-41cf-a6a5-af399f75ecc1',
    name: 'Connect.Tech 2028',
    description:
      'The largest multi-framework front-end conference in the USA. A three day event diving deep with experts from across the tech ecosystem.',
    timezone: 'America/New_York',
    start_at: DateTime.parse('October 24, 2028 08:00:00'),
    end_at: DateTime.parse('October 26, 2028 05:00:00'),
    venue_type: 'IN_PERSON',
    venue_name: 'Georgia World Congress Center',
    address: '285 Andrew Young International Blvd NW',
    country: 'USA',
    city: 'Atlanta',
    state_or_province: 'GA',
    postal_code: '30313',
    registration_start_at: DateTime.parse('May 1, 2028 08:00:00'),
    registration_end_at: DateTime.parse('September 15, 2028 23:59:59'),
    currency: 'USD',
    capacity: nil,
  },
  {
    id: '97d64e90-2c53-41cf-a6a5-af399f75ecc2',
    name: 'Connect.Tech 2029',
    description:
      'The largest multi-framework front-end conference in the USA. A three day event diving deep with experts from across the tech ecosystem.',
    timezone: 'America/New_York',
    start_at: DateTime.parse('October 24, 2029 08:00:00'),
    end_at: DateTime.parse('October 26, 2029 05:00:00'),
    venue_type: 'IN_PERSON',
    venue_name: 'Georgia World Congress Center',
    address: '285 Andrew Young International Blvd NW',
    country: 'USA',
    city: 'Atlanta',
    state_or_province: 'GA',
    postal_code: '30313',
    registration_start_at: DateTime.parse('May 1, 2029 08:00:00'),
    registration_end_at: DateTime.parse('September 15, 2029 23:59:59'),
    currency: 'USD',
    capacity: nil,
  }
]
events.each do |event|
  Event.find_or_create_by!(event)
end

speakers = [
  {
    id: '0b640391-5a8e-4c1c-8136-7c4a881c9383',
    event_id: '97d64e90-2c53-41cf-a6a5-af399f75ecc5',
    name: 'The Challenges of the GraphQL Mental Model',
    description:
      "GraphQL can be an amazing tool for teams to implement the APIs powering their different applications that rely on the same source of data. However, the mental model required for it may not be as straightforward as traditional solutions. In this session, we'll explore these challenges and how to mitigate them on your teams.",
    start_at: DateTime.parse('October 26, 2023 14:00:00'),
    end_at: DateTime.parse('October 26, 2023 15:00:00'),
    capacity: nil,
  },
  {
    id: '85c0b781-2e1d-4f0a-932e-05bd764fb45d',
    event_id: '97d64e90-2c53-41cf-a6a5-af399f75ecc5',
    name: 'One app, multiple platforms: How Cross Platform Actually Works',
    description:
      'Today\'s solutions for cross platform development all aim to provide developers a better way to build their apps. Build your app in a certain way, and you can ship it to multiple targets (iOS, Android, Web, etc.) with ease. But not all solutions are created equal, and it can be difficult to understand the benefits of one solution over another. But it doesn\'t have to be this way. In this talk we will look at some of the top cross platform technologies, see how they actually work, why you would use one solution, and why you should rethink your perception of what tool is "the best".',
    start_at: DateTime.parse('October 26, 2023 10:00:00'),
    end_at: DateTime.parse('October 26, 2023 11:00:00'),
    capacity: nil,
  },
  {
    id: 'ba895dd6-4e49-4c0e-856e-6ea8fa8ed54a',
    event_id: '97d64e90-2c53-41cf-a6a5-af399f75ecc5',
    name: 'Lessons Learned from 10 Years in React',
    description:
      "This session explores the lessons I've learned from working in React for the last (nearly) 10 years including rethinking separation of concerns, propTypes vs types, how to choose between state management approaches, performance optimizations, form optimizations, Storybook driven development workflows, utilizing mock APIs, custom dev tools, and sharing components. In this session, I'll share the many mistakes I've made, and the useful techniques I've found along the way.",
    start_at: DateTime.parse('October 25, 2023 10:00:00'),
    end_at: DateTime.parse('October 25, 2023 11:00:00'),
    capacity: nil,
  },
  {
    id: '72ebe0af-27f9-4873-afb5-3dd76c95b2ba',
    event_id: '97d64e90-2c53-41cf-a6a5-af399f75ecc5',
    name: 'React: The Most Common Mistakes in 2023',
    description:
      "React is unopinionated. This makes it flexible. But it also means it's intimidating to get started, and difficult to scale. You constantly wonder if you're \"doing it wrong\". In this session, we'll explore the most common mistakes teams are making in modern React applications, and how to avoid them.",
    start_at: DateTime.parse('October 25, 2023 14:00:00'),
    end_at: DateTime.parse('October 25, 2023 15:00:00'),
    capacity: nil,
  },
]
speakers.each do |speaker|
  EventSession.find_or_create_by!(speaker)
end
