# frozen_string_literal: true

json.array! @event_speakers, partial: 'event_speakers/event_speaker', as: :event_speaker
