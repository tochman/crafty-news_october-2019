# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "whatever-#{rand(1...1000)}@mail.com" }
    password { 'password' }
  end
end
