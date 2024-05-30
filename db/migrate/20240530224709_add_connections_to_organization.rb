# frozen_string_literal: true

class AddConnectionsToOrganization < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :platform_organization, foreign_key: true
    create_table :platform_organization_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :platform_organization, null: false, foreign_key: true
      t.timestamps
    end
  end
end
