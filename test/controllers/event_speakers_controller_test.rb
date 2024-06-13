# frozen_string_literal: true

require 'test_helper'

class EventSpeakersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:local)
    @event_speaker = event_speakers(:dustin)
  end

  test 'should get index' do
    get event_speakers_url(event_id: @event_speaker.event_id)
    assert_response :success
  end

  test 'should get new' do
    get new_event_speaker_url(event_id: @event_speaker.event_id)
    assert_response :success
  end

  test 'should create event_speaker' do
    new_first_name = Faker::Name.first_name
    new_last_name = Faker::Name.last_name

    assert_difference('EventSpeaker.count') do
      post event_speakers_url(event_id: @event_speaker.event_id),
           params: {
             event_speaker: {
               first_name: new_first_name,
               last_name: new_last_name,
               bio: @event_speaker.bio,
               company: @event_speaker.company,
               date_of_birth: @event_speaker.date_of_birth,
               ip_address: @event_speaker.ip_address,
               job_title: @event_speaker.job_title,
               language: @event_speaker.language,
               profile_picture: @event_speaker.profile_picture
             }
           }
    end
    new_speaker = EventSpeaker.find_by(
      event_id: @event_speaker.event_id,
      first_name: new_first_name,
      last_name: new_last_name
    )
    assert_redirected_to event_speaker_url(event_id: new_speaker.event_id, id: new_speaker.id)
  end

  test 'should show event_speaker' do
    get event_speaker_url(event_id: @event_speaker.event_id, id: @event_speaker.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_event_speaker_url(event_id: @event_speaker.event_id, id: @event_speaker.id)
    assert_response :success
  end

  test 'should update event_speaker' do
    patch event_speaker_url(event_id: @event_speaker.event_id, id: @event_speaker.id),
          params: {
            event_speaker: {
              bio: @event_speaker.bio,
              company: @event_speaker.company,
              date_of_birth: @event_speaker.date_of_birth,
              first_name: @event_speaker.first_name,
              ip_address: @event_speaker.ip_address,
              job_title: @event_speaker.job_title,
              language: @event_speaker.language,
              last_name: @event_speaker.last_name,
              profile_picture: @event_speaker.profile_picture
            }
          }
    assert_redirected_to event_speaker_url(event_id: @event_speaker.event_id, id: @event_speaker.id)
  end

  test 'should destroy event_speaker' do
    assert_difference('EventSpeaker.count', -1) do
      delete event_speaker_url(event_id: @event_speaker.event_id, id: @event_speaker.id)
    end

    assert_redirected_to event_speakers_url(event_id: @event_speaker.event_id)
  end
end
