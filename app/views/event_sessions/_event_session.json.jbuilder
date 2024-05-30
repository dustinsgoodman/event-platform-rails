# frozen_string_literal: true

json.extract! event_session, :id, :name, :description, :start_at, :end_at, :capacity, :created_at, :updated_at
json.url event_session_url(event_session, format: :json)
