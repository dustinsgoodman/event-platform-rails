# frozen_string_literal: true

class AddConnectionsToOrganization < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :platform_organization, foreign_key: true
    create_join_table :platform_organizations, :users, column_options: {
      type: :string
    }
  end
end
