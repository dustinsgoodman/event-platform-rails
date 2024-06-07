# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'validates name presence' do
    organization = platform_organizations(:connect_tech)
    event = Event.new(
      platform_organization_id: organization.id,
      start_at: 1.minute.from_now,
      end_at: 1.day.from_now
    )
    assert_not event.save, 'Saved invalid event'
    assert event.errors.full_messages.length == 1, "Expected 1 error, got #{event.errors.full_messages.length}"
    assert_includes event.errors.full_messages, "Name can't be blank"
  end

  test 'validates date' do
    organization = platform_organizations(:connect_tech)
    event = Event.new(platform_organization_id: organization.id, name: 'Test Event')

    assert_not event.save, 'Saved invalid event'
    assert event.errors.full_messages.length == 2, "Expected 1 error, got #{event.errors.full_messages.length}"

    event.start_at = 1.day.ago
    event.end_at = 2.days.ago
    assert_not event.save, 'Saved invalid event'
    assert event.errors.full_messages.length == 2, "Expected 1 error, got #{event.errors.full_messages.length}"
  end
end
