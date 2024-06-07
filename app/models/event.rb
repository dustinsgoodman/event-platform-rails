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
    errors.add(:start_at, I18n.t('Event.Validation.StartAt.Presence')) if start_at.blank?
    errors.add(:end_at, I18n.t('Event.Validation.EndAt.Presence')) if end_at.blank?

    return if errors.present?

    errors.add(:start_at, I18n.t('Event.Validation.StartAt.Future')) if start_at_changed? && start_at < Time.zone.now
    errors.add(:end_at, I18n.t('Event.Validation.EndAt.AfterStartAt')) if start_at > end_at
  end
end
