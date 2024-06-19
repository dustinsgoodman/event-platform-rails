# frozen_string_literal: true

class AdminController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def navigation_tree
    @current_user = User.joins(%i[platform_organizations current_platform_organization]).find(current_user.id)
    @current_platform_organization = @current_user.current_platform_organization
    @platform_organizations = @current_user.platform_organizations

    [
      {
        title: 'Events',
        path: events_path
      },
      {
        title: 'User Management',
        path: '#'
      },
      {
        title: @current_platform_organization.try(:name) || 'No Organization Found',
        submenu: @platform_organizations.filter_map do |platform_organization|
          if platform_organization != @current_platform_organization
            {
              title: platform_organization.name,
              path: change_current_organization_users_path(id: platform_organization.id),
              method: :post
            }
          end
        end
      },
      {
        title: @current_user.email,
        submenu: [
          {
            title: 'Log out',
            path: destroy_user_session_path,
            method: :delete
          }
        ]
      }
    ]
  end
  helper_method :navigation_tree
end
