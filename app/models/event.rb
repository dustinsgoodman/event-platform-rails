# frozen_string_literal: true

class Event < ApplicationRecord
  enum venue_type: { in_person: 'IN_PERSON', online: 'ONLINE', hybrid: 'HYBRID' }
  has_many :event_sessions, dependent: :destroy
  has_many :event_speakers, dependent: :destroy
  belongs_to :platform_organization

  # validates :name, presence: true
  # validates :start_at, presence: true
  # validates :end_at, presence: true, date: { after: :start_at }
end
