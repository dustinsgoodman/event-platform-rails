# frozen_string_literal: true

class User < ApplicationRecord
  has_many :platform_organizations_users, dependent: :destroy
  has_many :platform_organizations, through: :platform_organizations_users
  devise :omniauthable, omniauth_providers: %i[developer]
  devise :database_authenticatable, :registerable

  def self.from_omniauth(auth)
    raise NotImplementedError, 'TODO'
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.developer_data'] && session['devise.developer_data']['extra']['raw_info']) && user.email.blank?
        user.email = data['email']
      end
    end
  end

  def send_devise_notification(notification, *)
    devise_mailer.send(notification, self, *).deliver_later
  end

  def org_access?(org_id)
    platform_organization_ids.include?(org_id)
  end

  def current_org
    # TODO: should come from the session or database or some other persistent storage
    platform_organizations.first
  end
end
