# frozen_string_literal: true

json.array! @event_sessions, partial: 'event_sessions/event_session', as: :event_session
