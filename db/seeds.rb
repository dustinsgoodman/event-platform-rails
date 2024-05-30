# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@user = User.find_or_create_by!(email: 'local@test.com') do |user|
  user.password = 'password'
  user.provider = 'developer'
  user.uid = ''
end

speaker_dustin = {
  first_name: 'Dustin',
  last_name: 'Goodman',
  job_title: 'Engineering Manager',
  company: 'This Dot',
  profile_picture:
    'https://sessionize.com/image/997e-400o400o2-ErWnrX3Q6Z4sefhpd86weG.jpg',
  date_of_birth: Date.parse('November 2, 1990'),
  language: 'en-US',
  ip_address: '171.174.170.81',
  bio: 'Dustin Goodman is an engineer, tech speaker, and blogger with over a decade of experience in web development. He currently acts as an Engineering Manager at This Dot, and actively contributes free community resources through This Dot Media. He actively engages in the tech communities to bring new tech to people in accessible ways. He loves learning new tech and finding ways to use it in meaningful ways within projects. Additionally, he enjoys mentoring rising developers and helping them attain the knowledge and skills they need to level-up.'
}
speaker_mike = {
  first_name: 'Mike',
  last_name: 'Hartington',
  job_title: 'Developer/Advocate',
  company: 'Ionic',
  profile_picture:
    'https://sessionize.com/image/4fa6-400o400o2-94cLY2MbjsgFNAGjoyaKxV.jpg',
  date_of_birth: Date.parse('February 19, 1988'),
  language: 'en-US',
  ip_address: '95.25.112.121',
  bio: "Mike is a developer, Angular GDE, and Director of Developer Advocacy at Ionic who's been working in the mobile landscape for most of his professional career. When he's not working Ionic itself, Mike works with community members and helps them succeed at mobile. In his spare time, he’s an aspiring woodworker, occasional musician, and craft beer lover."
}
speaker_cory = {
  first_name: 'Cory',
  last_name: 'House',
  job_title: 'Author / Consultant',
  company: nil,
  profile_picture:
    'https://sessionize.com/image/af5d-400o400o2-BkPm4ggeAKRPpzBY1mPi2g.jpg',
  date_of_birth: Date.parse('September 17, 1984'),
  language: 'en-US',
  ip_address: '51.105.121.194',
  bio: 'Cory is a Pluralsight author, 9 time Microsoft MVP, and international speaker. He is founder of reactjsconsulting, where he helps companies transition to React. He has trained over 10,000 software developers at conferences and businesses worldwide. Cory has authored over a dozen courses on JavaScript, React, C#, automated testing, and web development on Pluralsight. He shares software development tips daily on Twitter as @housecor.'
}
events = [
  {
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
    event_sessions: [
      {
        name: 'The Challenges of the GraphQL Mental Model',
        description:
          "GraphQL can be an amazing tool for teams to implement the APIs powering their different applications that rely on the same source of data. However, the mental model required for it may not be as straightforward as traditional solutions. In this session, we'll explore these challenges and how to mitigate them on your teams.",
        start_at: DateTime.parse('October 26, 2023 14:00:00'),
        end_at: DateTime.parse('October 26, 2023 15:00:00'),
        capacity: nil,
        event_speaker: speaker_dustin
      },
      {
        name: 'One app, multiple platforms: How Cross Platform Actually Works',
        description:
          'Today\'s solutions for cross platform development all aim to provide developers a better way to build their apps. Build your app in a certain way, and you can ship it to multiple targets (iOS, Android, Web, etc.) with ease. But not all solutions are created equal, and it can be difficult to understand the benefits of one solution over another. But it doesn\'t have to be this way. In this talk we will look at some of the top cross platform technologies, see how they actually work, why you would use one solution, and why you should rethink your perception of what tool is "the best".',
        start_at: DateTime.parse('October 26, 2023 10:00:00'),
        end_at: DateTime.parse('October 26, 2023 11:00:00'),
        capacity: nil,
        event_speaker: speaker_mike
      },
      {
        name: 'Lessons Learned from 10 Years in React',
        description:
          "This session explores the lessons I've learned from working in React for the last (nearly) 10 years including rethinking separation of concerns, propTypes vs types, how to choose between state management approaches, performance optimizations, form optimizations, Storybook driven development workflows, utilizing mock APIs, custom dev tools, and sharing components. In this session, I'll share the many mistakes I've made, and the useful techniques I've found along the way.",
        start_at: DateTime.parse('October 25, 2023 10:00:00'),
        end_at: DateTime.parse('October 25, 2023 11:00:00'),
        capacity: nil,
        event_speaker: speaker_cory
      },
      {
        name: 'React: The Most Common Mistakes in 2023',
        description:
          "React is unopinionated. This makes it flexible. But it also means it's intimidating to get started, and difficult to scale. You constantly wonder if you're \"doing it wrong\". In this session, we'll explore the most common mistakes teams are making in modern React applications, and how to avoid them.",
        start_at: DateTime.parse('October 25, 2023 14:00:00'),
        end_at: DateTime.parse('October 25, 2023 15:00:00'),
        capacity: nil,
        event_speaker: speaker_cory
      }
    ]
  },
  {
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
    capacity: nil
  },
  {
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
    capacity: nil
  },
  {
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
    capacity: nil
  },
  {
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
    capacity: nil
  },
  {
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
    capacity: nil
  },
  {
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
    capacity: nil
  }
]
events.each do |event|
  evt = Event.find_or_create_by!(name: event[:name]) do |e|
    event.except(:event_sessions).each do |key, value|
      e[key] = value
    end
  end

  next if event[:event_sessions].blank?

  event[:event_sessions].each do |session|
    sess = evt.event_sessions.find_or_create_by!(name: session[:name]) do |s|
      session.except(:event_speaker).each do |key, value|
        s[key] = value
      end
    end

    next if session[:event_speaker].blank?

    speaker = session[:event_speaker]
    speaker[:event_id] = evt.id
    speaker = evt.event_speakers.find_or_create_by!(first_name: speaker[:first_name],
                                                    last_name: speaker[:last_name]) do |sp|
      speaker.each do |key, value|
        sp[key] = value
      end
      speaker[:event_sessions] = [sess]
    end
  end
end
