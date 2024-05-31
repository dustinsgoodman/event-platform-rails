# frozen_string_literal: true

class Event < ApplicationRecord
  enum venue_type: { in_person: 'IN_PERSON', online: 'ONLINE', hybrid: 'HYBRID' }
  has_many :event_sessions, dependent: :destroy
  has_many :event_speakers, dependent: :destroy
  belongs_to :platform_organization

  validates :name, presence: true
  validate :dates

  private

  def dates
    errors.add(:start_at, 'must be present') if start_at.blank?
    errors.add(:end_at, 'must be present') if end_at.blank?

    return if errors.present?

    errors.add(:start_at, 'must be before the end date') if start_at > end_at
    errors.add(:start_at, 'must be in the future') if start_at < Time.zone.now
  end
end
