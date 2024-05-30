# frozen_string_literal: true

json.extract! event_speaker, :id, :first_name, :last_name, :job_title, :company, :profile_picture, :bio,
              :date_of_birth, :language, :ip_address, :created_at, :updated_at
json.url event_speaker_url(event_speaker, format: :json)
