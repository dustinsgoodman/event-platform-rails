# frozen_string_literal: true

class CreatePlatformOrganizationConnections < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :platform_organization, foreign_key: true, type: :string
    create_table :platform_organizations_users do |t|
      t.references :user, null: false, foreign_key: true, type: :string
      t.references :platform_organization, null: false, foreign_key: true, type: :string
      t.timestamps
    end
  end
end
