# frozen_string_literal: true

class PlatformOrganization < ApplicationRecord
  has_many :platform_organizations_users, dependent: :destroy
  has_many :users, through: :platform_organizations_users
  has_many :events, dependent: :destroy

  validates :name, presence: true

  before_destroy :clear_users_current_organization, prepend: true

  private

  def clear_users_current_organization
    users
      .where(current_platform_organization: self)
      .update_all(current_platform_organization_id: nil) # rubocop:disable Rails/SkipsModelValidations
  end
end
