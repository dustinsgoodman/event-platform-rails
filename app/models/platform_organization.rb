# frozen_string_literal: true

class PlatformOrganization < ApplicationRecord
  has_many :platform_organizations_users, dependent: :destroy
  has_many :users, through: :platform_organizations_users
  has_many :events, dependent: :destroy

  validates :name, presence: true
end
