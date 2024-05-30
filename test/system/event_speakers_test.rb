# frozen_string_literal: true

require 'application_system_test_case'

class EventSpeakersTest < ApplicationSystemTestCase
  setup do
    @event_speaker = event_speakers(:one)
  end

  test 'visiting the index' do
    visit event_speakers_url
    assert_selector 'h1', text: 'Event speakers'
  end

  test 'should create event speaker' do
    visit event_speakers_url
    click_on 'New event speaker'

    fill_in 'Bio', with: @event_speaker.bio
    fill_in 'Company', with: @event_speaker.company
    fill_in 'Date of birth', with: @event_speaker.date_of_birth
    fill_in 'First name', with: @event_speaker.first_name
    fill_in 'Ip address', with: @event_speaker.ip_address
    fill_in 'Job title', with: @event_speaker.job_title
    fill_in 'Language', with: @event_speaker.language
    fill_in 'Last name', with: @event_speaker.last_name
    fill_in 'Profile picture', with: @event_speaker.profile_picture
    click_on 'Create Event speaker'

    assert_text 'Event speaker was successfully created'
    click_on 'Back'
  end

  test 'should update Event speaker' do
    visit event_speaker_url(@event_speaker)
    click_on 'Edit this event speaker', match: :first

    fill_in 'Bio', with: @event_speaker.bio
    fill_in 'Company', with: @event_speaker.company
    fill_in 'Date of birth', with: @event_speaker.date_of_birth
    fill_in 'First name', with: @event_speaker.first_name
    fill_in 'Ip address', with: @event_speaker.ip_address
    fill_in 'Job title', with: @event_speaker.job_title
    fill_in 'Language', with: @event_speaker.language
    fill_in 'Last name', with: @event_speaker.last_name
    fill_in 'Profile picture', with: @event_speaker.profile_picture
    click_on 'Update Event speaker'

    assert_text 'Event speaker was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Event speaker' do
    visit event_speaker_url(@event_speaker)
    click_on 'Destroy this event speaker', match: :first

    assert_text 'Event speaker was successfully destroyed'
  end
end
