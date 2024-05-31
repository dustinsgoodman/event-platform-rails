# frozen_string_literal: true

class EventSessionSpeaker < ApplicationRecord
  belongs_to :event_session
  belongs_to :event_speaker
  skip_callback :create, :before, :maybe_assign_id
end
