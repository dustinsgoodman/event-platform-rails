# frozen_string_literal: true

require 'application_system_test_case'

class PlatformOrganizationsTest < ApplicationSystemTestCase
  setup do
    @platform_organization = platform_organizations(:one)
  end

  test 'visiting the index' do
    visit platform_organizations_url
    assert_selector 'h1', text: 'Platform organizations'
  end

  test 'should create platform organization' do
    visit platform_organizations_url
    click_on 'New platform organization'

    click_on 'Create Platform organization'

    assert_text 'Platform organization was successfully created'
    click_on 'Back'
  end

  test 'should update Platform organization' do
    visit platform_organization_url(@platform_organization)
    click_on 'Edit this platform organization', match: :first

    click_on 'Update Platform organization'

    assert_text 'Platform organization was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Platform organization' do
    visit platform_organization_url(@platform_organization)
    click_on 'Destroy this platform organization', match: :first

    assert_text 'Platform organization was successfully destroyed'
  end
end
