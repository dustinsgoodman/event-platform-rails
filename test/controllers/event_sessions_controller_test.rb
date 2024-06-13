# frozen_string_literal: true

require 'test_helper'

class EventSessionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:local)
    @event = events(:connect_tech_2023)
    @event_session = event_sessions(:challenge_graphql)
  end

  test 'should get index' do
    get event_sessions_url(event_id: @event.id)
    assert_response :success
  end

  test 'should get new' do
    get new_event_session_url(event_id: @event.id)
    assert_response :success
  end

  test 'should create event_session' do
    name = Faker::Lorem.sentence
    assert_difference('EventSession.count') do
      post event_sessions_url(event_id: @event.id),
           params: { event_session: { capacity: @event_session.capacity, description: @event_session.description,
                                      end_at: @event_session.end_at, name:, start_at: @event_session.start_at } }
    end

    new_event_session = EventSession.find_by(event_id: @event.id, name:)
    assert_redirected_to event_session_url(event_id: new_event_session.event_id, id: new_event_session.id)
  end

  test 'should show event_session' do
    get event_session_url(event_id: @event.id, id: @event_session)
    assert_response :success
  end

  test 'should get edit' do
    get edit_event_session_url(event_id: @event.id, id: @event_session)
    assert_response :success
  end

  test 'should update event_session' do
    patch event_session_url(event_id: @event.id, id: @event_session),
          params: { event_session: { capacity: @event_session.capacity, description: @event_session.description,
                                     end_at: @event_session.end_at, name: @event_session.name, start_at: @event_session.start_at } }
    assert_redirected_to event_session_url(event_id: @event.id, id: @event_session.id)
  end

  test 'should destroy event_session' do
    assert_difference('EventSession.count', -1) do
      delete event_session_url(event_id: @event.id, id: @event_session.id)
    end

    assert_redirected_to event_sessions_url
  end
end
