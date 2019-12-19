# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root controller: :articles, action: :index
  resources :articles, except: :index do
    resources :comments, only: [:create]
  end
  resources :subscriptions, only: %i[new create]
end
