class CreateEventSpeakers < ActiveRecord::Migration[7.1]
  def change
    create_table :event_speakers, id: false do |t|
      t.string :id, primary_key: true, default: -> { "gen_random_uuid()" }

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :job_title
      t.string :company
      t.string :profile_picture
      t.text :bio, null: false
      t.datetime :date_of_birth, null: false
      t.string :language, null: false, default: 'en-US'
      # Internal Admin
      t.string :ip_address

      t.timestamps

      # Relationships
      t.references :event, index: true, foreign_key: true, type: :string
    end

    create_join_table :event_sessions, :event_speakers, table_name: :event_sessions_event_speakers, column_options: {
      type: :string
    }
  end
end
