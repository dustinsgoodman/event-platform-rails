# frozen_string_literal: true

require 'test_helper'

class PlatformOrganizationTest < ActiveSupport::TestCase
  test 'validates name presence' do
    organization = PlatformOrganization.new
    assert_not organization.save, 'Saved invalid organization'
    assert organization.errors.full_messages.length == 1, "Expected 1 error, got #{organization.errors.full_messages.length}"
    assert_includes organization.errors.full_messages, "Name can't be blank"
  end
end
