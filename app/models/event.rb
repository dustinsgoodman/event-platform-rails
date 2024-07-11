# frozen_string_literal: true

class Event < ApplicationRecord
  enum venue_type: { in_person: 'IN_PERSON', online: 'ONLINE', hybrid: 'HYBRID' }

  has_many :event_sessions, dependent: :destroy
  has_many :event_speakers, dependent: :destroy
  belongs_to :platform_organization

  after_initialize :set_defaults

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validate :timezone_format
  validate :dates
  validate :registration_dates
  validate :currency_type
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :venue_type, inclusion: venue_types.keys
  validate :venue_info, unless: :online?

  private

  def set_defaults
    self.currency ||= 'USD'
    self.timezone ||= 'America/New_York'
  end

  def currency_type
    return if SUPPORTED_CURRENCIES.include?(currency)

    errors.add(:currency, I18n.t('Event.Validation.Currency.Type', currencies: SUPPORTED_CURRENCIES.join(', ')))
  end

  def timezone_format
    errors.add(:timezone, I18n.t('Event.Validation.Timezone.Presence')) if timezone.blank?
    begin
      ActiveSupport::TimeZone.find_tzinfo(timezone)
    rescue TZInfo::InvalidTimezoneIdentifier
      errors.add(:timezone, I18n.t('Event.Validation.Timezone.Format'))
    end
  end

  def dates
    errors.add(:start_at, I18n.t('Event.Validation.StartAt.Presence')) if start_at.blank?
    errors.add(:end_at, I18n.t('Event.Validation.EndAt.Presence')) if end_at.blank?

    return if errors.present?

    errors.add(:start_at, I18n.t('Event.Validation.StartAt.Future')) if start_at_changed? && start_at < Time.zone.now
    errors.add(:end_at, I18n.t('Event.Validation.EndAt.AfterStartAt')) if start_at > end_at
  end

  def registration_dates
    return if registration_start_at.blank?

    errors.add(:registration_start_at, I18n.t('Event.Validation.RegistrationStartAt.BeforeRegistrationEndAt')) if registration_end_at && registration_start_at >= registration_end_at
    errors.add(:registration_start_at, I18n.t('Event.Validation.RegistrationStartAt.BeforeStartAt')) if start_at && registration_start_at >= start_at
  end

  # TODO: Implement venue_info validation
  def venue_info
    # %i[venue_name address country city state_or_province postal_code]
  end
end
