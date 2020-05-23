# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    get 'rooms/index'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lobby#index'

  namespace :api do
    resources :rooms do
      member do
        post :join
      end
    end

    resources :stations, only: %i[index]
  end
end
