# frozen_string_literal: true

class AddCurrentPlatformOrganizationToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users,
                  :current_platform_organization,
                  type: :string,
                  index: true,
                  foreign_key: { to_table: :platform_organizations },
                  null: true
  end
end
