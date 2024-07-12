# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token, only: :developer

    def google_oauth2
      @user = User.from_omniauth(:google_oauth2, request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end

    def developer
      # {"provider"=>"developer", "uid"=>"", "info"=>{"name"=>"test", "email"=>""}, "credentials"=>{}, "extra"=>{}}
      @user = User.from_omniauth(:developer, request)

      if @user
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Developer') if is_navigational_format?
      else
        session['devise.developer_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url
      end
    end
  end
end
