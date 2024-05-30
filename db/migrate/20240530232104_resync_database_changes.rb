class ResyncDatabaseChanges < ActiveRecord::Migration[7.1]
  def change
    drop_table :event_sessions_event_speakers do |t|
      t.references :event_sessions, null: false, foreign_key: true
      t.references :event_speakers, null: false, foreign_key: true

      t.timestamps
    end

    remove_column :users, :id
    change_table :users do |t|
      t.string   :id, primary_key: true # , default: -> { 'gen_random_uuid()' }
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at
    end
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
