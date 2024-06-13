# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '.from_omniauth' do
    skip 'TODO'
  end

  test '.new_with_session' do
    subject = User.new_with_session({}, {})
    assert_instance_of User, subject, 'Did not return a User object'
    assert subject.email.blank?, 'Email was not blank'

    fake_email = Faker::Internet.unique.email
    session = {
      'devise.developer_data' => {
        'extra' => {
          'raw_info' => {
            'email' => fake_email
          }
        }
      }
    }

    fake_email2 = Faker::Internet.unique.email
    subject = User.new_with_session({ email: fake_email2 }, session)
    assert_instance_of User, subject, 'Did not return a User object'
    assert_not subject.email == fake_email, 'Email matched session and should not have'
    assert subject.email == fake_email2, 'Email did not match params value'
  end

  test '#send_devise_notification' do
    skip 'Pending active mailer testing setup'
  end

  test '#platform_organization_access?' do
    local_user, empty_user = users(:local, :empty)
    organization = platform_organizations(:connect_tech)

    assert local_user.platform_organization_access?(organization.id), 'User does not have access to organization and should'
    assert_not empty_user.platform_organization_access?(organization.id), 'User has access to organization and should not'
  end

  test '#current_platform_organization' do
    local_user = users(:local)
    organization = platform_organizations(:connect_tech)
    assert local_user.current_platform_organization == organization, 'User does not have a current organization'
  end
end
