# frozen_string_literal: true

require 'application_system_test_case'

class EventSessionsTest < ApplicationSystemTestCase
  setup do
    @event_session = event_sessions(:one)
  end

  test 'visiting the index' do
    visit event_sessions_url
    assert_selector 'h1', text: 'Event sessions'
  end

  test 'should create event session' do
    visit event_sessions_url
    click_on 'New event session'

    fill_in 'Capcity', with: @event_session.capcity
    fill_in 'Description', with: @event_session.description
    fill_in 'End at', with: @event_session.end_at
    fill_in 'Name', with: @event_session.name
    fill_in 'Start at', with: @event_session.start_at
    click_on 'Create Event session'

    assert_text 'Event session was successfully created'
    click_on 'Back'
  end

  test 'should update Event session' do
    visit event_session_url(@event_session)
    click_on 'Edit this event session', match: :first

    fill_in 'Capcity', with: @event_session.capcity
    fill_in 'Description', with: @event_session.description
    fill_in 'End at', with: @event_session.end_at
    fill_in 'Name', with: @event_session.name
    fill_in 'Start at', with: @event_session.start_at
    click_on 'Update Event session'

    assert_text 'Event session was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Event session' do
    visit event_session_url(@event_session)
    click_on 'Destroy this event session', match: :first

    assert_text 'Event session was successfully destroyed'
  end
end
