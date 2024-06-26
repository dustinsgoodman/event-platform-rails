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

ActiveRecord::Schema[7.1].define(version: 2024_06_28_000130) do
  create_table "event_session_speakers", id: false, force: :cascade do |t|
    t.string "event_session_id", null: false
    t.string "event_speaker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_session_id"], name: "index_event_session_speakers_on_event_session_id"
    t.index ["event_speaker_id"], name: "index_event_session_speakers_on_event_speaker_id"
  end

  create_table "event_sessions", id: :string, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_id"
    t.index ["event_id", "name"], name: "index_event_sessions_on_event_id_and_name", unique: true
    t.index ["event_id"], name: "index_event_sessions_on_event_id"
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
    t.string "email", default: "", null: false
    t.index ["event_id", "email"], name: "index_event_speakers_on_event_id_and_email", unique: true
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
    t.datetime "registration_start_at"
    t.datetime "registration_end_at"
    t.string "currency", default: "USD", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "platform_organization_id"
    t.index ["platform_organization_id"], name: "index_events_on_platform_organization_id"
  end

  create_table "platform_organizations", id: :string, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platform_organizations_users", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "platform_organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_organization_id"], name: "index_platform_organizations_users_on_platform_organization_id"
    t.index ["user_id"], name: "index_platform_organizations_users_on_user_id"
  end

  create_table "users", id: :string, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", null: false
    t.string "uid", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "current_platform_organization_id"
    t.string "locale", default: "en-US", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["current_platform_organization_id"], name: "index_users_on_current_platform_organization_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "event_session_speakers", "event_sessions"
  add_foreign_key "event_session_speakers", "event_speakers"
  add_foreign_key "event_sessions", "events"
  add_foreign_key "event_speakers", "events"
  add_foreign_key "events", "platform_organizations"
  add_foreign_key "platform_organizations_users", "platform_organizations"
  add_foreign_key "platform_organizations_users", "users"
  add_foreign_key "users", "platform_organizations", column: "current_platform_organization_id"
end
