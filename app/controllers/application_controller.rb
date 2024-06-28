# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  around_action :switch_locale

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
        class: 'btn-primary'
      }
      tree << {
        title: 'Log out',
        path: destroy_user_session_path,
        class: 'btn-secondary',
        method: :delete
      }
    else
      tree << {
        title: 'Log In',
        path: new_user_session_path,
        class: 'btn-primary'
      }
    end

    tree
  end
  helper_method :navigation_tree

  private

  def switch_locale(&)
    locale = current_user.try(:locale)[0..1]
    locale ||= params[:locale]
    locale ||= I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def default_url_options
    if current_user
      {}
    else
      { locale: I18n.locale }
    end
  end
end
