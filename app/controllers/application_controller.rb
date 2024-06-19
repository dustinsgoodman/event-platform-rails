# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  def navigation_tree # rubocop:disable Metrics/MethodLength
    tree = [
      {
        title: 'Products',
        submenu: [
          { title: 'Product 1', path: '#' },
          { title: 'Product 2', path: '#' },
          { title: 'Product 3', path: '#' },
          { title: 'Product 4', path: '#' }
        ]
      },
      {
        title: 'About',
        submenu: [
          { title: 'About 1', path: '#' },
          { title: 'About 2', path: '#' },
          { title: 'About 3', path: '#' },
          { title: 'About 4', path: '#' }
        ]
      }
    ]
    if user_signed_in?
      tree << {
        title: 'Dashboard',
        path: events_path,
        class: 'btn btn-primary'
      }
      tree << {
        title: 'Log out',
        path: destroy_user_session_path,
        class: 'btn btn-secondary',
        method: :delete
      }
    else
      tree << {
        title: 'Log In',
        path: new_user_session_path,
        class: 'btn btn-primary'
      }
    end

    tree
  end
  helper_method :navigation_tree
end
