require "test_helper"

class EventSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_session = event_sessions(:one)
  end

  test "should get index" do
    get event_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_event_session_url
    assert_response :success
  end

  test "should create event_session" do
    assert_difference("EventSession.count") do
      post event_sessions_url, params: { event_session: { capcity: @event_session.capcity, description: @event_session.description, end_at: @event_session.end_at, name: @event_session.name, start_at: @event_session.start_at } }
    end

    assert_redirected_to event_session_url(EventSession.last)
  end

  test "should show event_session" do
    get event_session_url(@event_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_session_url(@event_session)
    assert_response :success
  end

  test "should update event_session" do
    patch event_session_url(@event_session), params: { event_session: { capcity: @event_session.capcity, description: @event_session.description, end_at: @event_session.end_at, name: @event_session.name, start_at: @event_session.start_at } }
    assert_redirected_to event_session_url(@event_session)
  end

  test "should destroy event_session" do
    assert_difference("EventSession.count", -1) do
      delete event_session_url(@event_session)
    end

    assert_redirected_to event_sessions_url
  end
end
