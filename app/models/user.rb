# frozen_string_literal: true

class User < ApplicationRecord
  has_many :platform_organizations_users, dependent: :destroy
  has_many :platform_organizations, through: :platform_organizations_users
  belongs_to :current_platform_organization,
             class_name: 'PlatformOrganization',
             optional: true,
             inverse_of: false
  devise :omniauthable, omniauth_providers: %i[developer]
  devise :database_authenticatable, :registerable

  validate :current_platform_organization_belongs_to_user

  def self.from_omniauth(auth)
    raise NotImplementedError, 'TODO'
    # find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    #   # If you are using confirmable and the provider(s) you use validate emails,
    #   # uncomment the line below to skip the confirmation emails.
    #   # user.skip_confirmation!
    # end
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

  def platform_organization_access?(org_id)
    platform_organization_ids.include?(org_id)
  end

  private

  def current_platform_organization_belongs_to_user
    return if current_platform_organization.nil? || platform_organization_ids.include?(current_platform_organization.id)

    errors.add(:current_platform_organization, 'must belong to the user')
  end
end
