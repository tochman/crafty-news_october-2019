# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles, only: %i[new create]
  root controller: :articles, action: :index
end
