# frozen_string_literal: true

class EventSession < ApplicationRecord
  belongs_to :event
  has_many :event_session_speakers, dependent: :delete_all
  has_many :event_speakers, through: :event_session_speakers
end
