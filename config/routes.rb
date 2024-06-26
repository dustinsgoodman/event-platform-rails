# frozen_string_literal: true

Rails.application.routes.draw do
  resources :platform_organizations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    post :change_current_organization, on: :collection
  end

  resources :events do
    resources :event_sessions, path: :sessions, as: :sessions
    resources :event_speakers, path: :speakers, as: :speakers
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
end
