class Event < ApplicationRecord
  enum venue_type: { in_person: "IN_PERSON", online: 'ONLINE', hybrid: 'HYBRID' }
  has_many :event_sessions, dependent: :destroy
  has_many :event_speakers, dependent: :destroy
end
