# frozen_string_literal: true

class AddEmailAndIndexToEventSpeaker < ActiveRecord::Migration[7.1]
  def change
    add_column :event_speakers, :email, :string, null: false, default: ''
    add_index :event_speakers, %i[event_id email], unique: true
  end
end
