# frozen_string_literal: true

class CreateEventSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :event_sessions, id: false do |t|
      t.string :id, primary_key: true, default: -> { 'gen_random_uuid()' }
      t.string :name, null: false
      t.text :description
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :capacity

      t.timestamps

      # Relationship to Event
      t.references :event, index: true, foreign_key: true, type: :string
    end
  end
end
