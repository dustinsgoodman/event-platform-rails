# frozen_string_literal: true

require 'test_helper'

class PlatformOrganizationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:local)
    @platform_organization = platform_organizations(:connect_tech)
  end

  test 'should get index' do
    get platform_organizations_url
    assert_response :success
  end

  test 'should get new' do
    get new_platform_organization_url
    assert_response :success
  end

  test 'should create platform_organization' do
    name = Faker::Company.name
    assert_difference('PlatformOrganization.count') do
      post platform_organizations_url, params: { platform_organization: { name: } }
    end

    assert_redirected_to platform_organization_url(PlatformOrganization.find_by(name:))
  end

  test 'should show platform_organization' do
    get platform_organization_url(@platform_organization)
    assert_response :success
  end

  test 'should get edit' do
    get edit_platform_organization_url(@platform_organization)
    assert_response :success
  end

  test 'should update platform_organization' do
    patch platform_organization_url(@platform_organization), params: { platform_organization: { name: Faker::Company.name } }
    assert_redirected_to platform_organization_url(@platform_organization)
  end

  test 'should destroy platform_organization' do
    assert_difference('PlatformOrganization.count', -1) do
      delete platform_organization_url(@platform_organization)
    end

    assert_redirected_to platform_organizations_url
  end
end
