# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_23_225808) do
  create_table "event_sessions", id: :string, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_id"
    t.index ["event_id"], name: "index_event_sessions_on_event_id"
  end

  create_table "event_sessions_event_speakers", id: false, force: :cascade do |t|
    t.string "event_session_id", null: false
    t.string "event_speaker_id", null: false
  end

  create_table "event_speakers", id: :string, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "job_title"
    t.string "company"
    t.string "profile_picture"
    t.text "bio", null: false
    t.datetime "date_of_birth", null: false
    t.string "language", default: "en-US", null: false
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_id"
    t.index ["event_id"], name: "index_event_speakers_on_event_id"
  end

  create_table "events", id: :string, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "timezone", null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.string "venue_type", default: "IN_PERSON", null: false
    t.string "venue_name"
    t.string "address"
    t.string "country"
    t.string "city"
    t.string "state_or_province"
    t.string "postal_code"
    t.datetime "registration_start_at", null: false
    t.datetime "registration_end_at", null: false
    t.string "currency", default: "USD", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_sessions", "events"
  add_foreign_key "event_speakers", "events"
end
