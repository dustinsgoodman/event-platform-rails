class Event < ApplicationRecord
  enum venue_type: { in_person: "IN_PERSON", online: 'ONLINE', hybrid: 'HYBRID' }
  has_many :event_sessions, as: :sessions, dependent: :destroy

  before_create :maybe_assign_id

  def maybe_assign_id
    self.id = SecureRandom.uuid if self.id.blank?
  end
end
