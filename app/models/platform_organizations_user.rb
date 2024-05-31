# frozen_string_literal: true

class PlatformOrganizationsUser < ApplicationRecord
  belongs_to :user
  belongs_to :platform_organization
  skip_callback :create, :before, :maybe_assign_id
end
