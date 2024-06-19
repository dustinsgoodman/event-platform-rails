# frozen_string_literal: true

class UsersController < AdminController
  def change_current_organization
    organization = PlatformOrganization.find(params[:id])
    current_user.update(current_platform_organization: organization)
    redirect_back(fallback_location: '/')
  end
end
