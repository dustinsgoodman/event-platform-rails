# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:local)
    @event = events(:connect_tech2023)
  end

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_url
    assert_response :success
  end

  test 'should create event' do
    event_name = Faker::Esport.event
    assert_difference('Event.count') do
      post events_url, params: {
        event: {
          name: event_name,
          description: Faker::Lorem.paragraph,
          timezone: @event.timezone,
          start_at: 5.minutes.from_now,
          end_at: 20.minutes.from_now,
          registration_start_at: 1.minute.from_now,
          registration_end_at: 4.minutes.from_now
        }
      }
    end

    assert_redirected_to event_url(Event.find_by(name: event_name))
  end

  test 'should show event' do
    get event_url(@event)
    assert_response :success
  end

  test 'should get edit' do
    get edit_event_url(@event)
    assert_response :success
  end

  test 'should update event' do
    patch event_url(@event),
          params: { event: { description: @event.description, end_at: @event.end_at, name: @event.name,
                             start_at: @event.start_at, timezone: @event.timezone } }
    assert_redirected_to event_url(@event)
  end

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
