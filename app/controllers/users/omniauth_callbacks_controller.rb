class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :developer

  def developer
    # {"provider"=>"developer", "uid"=>"", "info"=>{"name"=>"test", "email"=>""}, "credentials"=>{}, "extra"=>{}}
    @user = User.find_by(
      email: request.env["omniauth.auth"].info.email
    )

    if @user
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Developer") if is_navigational_format?
    else
      session["devise.developer_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end
end
