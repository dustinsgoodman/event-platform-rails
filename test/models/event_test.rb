# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'should not save event without name' do
    org = PlatformOrganization.create(name: 'Test Organization')
    event = Event.new(platform_organization_id: org.id, start_at: 1.minute.from_now, end_at: 1.day.from_now, venue_type: 'IN_PERSON')
    assert_not event.save, 'Saved the event without a name'
  end
end
