class CreateEventSessionSpeakers < ActiveRecord::Migration[7.1]
  def change
    create_table :event_session_speakers do |t|
      t.references :event_sessions, null: false, foreign_key: true
      t.references :event_speakers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
