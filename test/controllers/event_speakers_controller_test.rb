require "test_helper"

class EventSpeakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_speaker = event_speakers(:one)
  end

  test "should get index" do
    get event_speakers_url
    assert_response :success
  end

  test "should get new" do
    get new_event_speaker_url
    assert_response :success
  end

  test "should create event_speaker" do
    assert_difference("EventSpeaker.count") do
      post event_speakers_url, params: { event_speaker: { bio: @event_speaker.bio, company: @event_speaker.company, date_of_birth: @event_speaker.date_of_birth, first_name: @event_speaker.first_name, ip_address: @event_speaker.ip_address, job_title: @event_speaker.job_title, language: @event_speaker.language, last_name: @event_speaker.last_name, profile_picture: @event_speaker.profile_picture } }
    end

    assert_redirected_to event_speaker_url(EventSpeaker.last)
  end

  test "should show event_speaker" do
    get event_speaker_url(@event_speaker)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_speaker_url(@event_speaker)
    assert_response :success
  end

  test "should update event_speaker" do
    patch event_speaker_url(@event_speaker), params: { event_speaker: { bio: @event_speaker.bio, company: @event_speaker.company, date_of_birth: @event_speaker.date_of_birth, first_name: @event_speaker.first_name, ip_address: @event_speaker.ip_address, job_title: @event_speaker.job_title, language: @event_speaker.language, last_name: @event_speaker.last_name, profile_picture: @event_speaker.profile_picture } }
    assert_redirected_to event_speaker_url(@event_speaker)
  end

  test "should destroy event_speaker" do
    assert_difference("EventSpeaker.count", -1) do
      delete event_speaker_url(@event_speaker)
    end

    assert_redirected_to event_speakers_url
  end
end
