# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root controller: :articles, action: :index
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :subscriptions, only: %i[new create]
  namespace :api do
    resources :articles, only: %i[index create update show]
  end
end
