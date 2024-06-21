# frozen_string_literal: true

class MakeEventRegistrationEndAtNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :events, :registration_start_at, true
    change_column_null :events, :registration_end_at, true
  end
end
