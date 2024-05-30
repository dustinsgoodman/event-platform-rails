# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_create :maybe_assign_id

  def maybe_assign_id
    self.id = SecureRandom.uuid if id.blank?
  end
end
