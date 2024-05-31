# frozen_string_literal: true

class CreatePlatformOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :platform_organizations, id: false do |t|
      t.string :id, primary_key: true, default: -> { 'gen_random_uuid()' }
      t.string :name, null: false
      t.timestamps
    end
  end
end
