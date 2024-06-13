# frozen_string_literal: true

class AddUniquenessIndexToEventSessionOnName < ActiveRecord::Migration[7.1]
  def change
    add_index :event_sessions, %i[event_id name], unique: true
  end
end
