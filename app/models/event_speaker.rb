# frozen_string_literal: true

class EventSpeaker < ApplicationRecord
  belongs_to :event
  has_and_belongs_to_many :event_sessions, join_table: :event_sessions_event_speakers
end
