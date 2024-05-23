class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: false do |t|
      t.string :id, primary_key: true, default: -> { "gen_random_uuid()" }
      # Event Metadata
      t.string :name, null: false
      t.text :description
      t.string :timezone, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false

      # Venue and Location Related Fields
      t.string :venue_type, default: 'IN_PERSON', null: false
      t.string :venue_name
      t.string :address
      t.string :country
      t.string :city
      t.string :state_or_province
      t.string :postal_code

      # Registration Related Fields
      t.datetime :registration_start_at, null: false
      t.datetime :registration_end_at, null: false
      t.string :currency, default: 'USD', null: false
      t.integer :capacity

      t.timestamps
    end
  end
end
