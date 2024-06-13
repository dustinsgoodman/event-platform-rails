# frozen_string_literal: true

class EventSpeaker < ApplicationRecord
  belongs_to :event
  has_many :event_session_speakers, dependent: :delete_all
  has_many :event_sessions, through: :event_session_speakers

  validates :email, uniqueness: {
    scope: :event_id,
    message: I18n.t('EventSpeaker.Validation.Email.Uniqueness')
  }
end
