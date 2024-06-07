# frozen_string_literal: true

class EventSpeaker < ApplicationRecord
  belongs_to :event
  has_many :event_session_speakers, dependent: :delete_all
  has_many :event_sessions, through: :event_session_speakers
end
