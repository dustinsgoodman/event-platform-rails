class CreateEventSessionSpeakers < ActiveRecord::Migration[7.1]
  def change
    create_table :event_session_speakers, id: false do |t|
      t.references :event_session, null: false, foreign_key: true, type: :string
      t.references :event_speaker, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
