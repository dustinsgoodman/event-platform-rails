class Event < ApplicationRecord
  enum venue_type: { in_person: "IN_PERSON", online: 'ONLINE', hybrid: 'HYBRID' }

  before_create :maybe_assign_id

  def maybe_assign_id
    self.id = SecureRandom.uuid if self.id.blank?
  end
end
