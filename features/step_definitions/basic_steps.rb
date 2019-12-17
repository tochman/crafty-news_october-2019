# frozen_string_literal: true

When('I am on the index page') do
  visit root_path
end

When("I fill in {string} with {string}") do |input, content|
  fill_in input, with: content
end

When("I click on {string}") do |element|
  click_on element
end


Given("I am logged in as {string}") do |email|
  user = create(:user, email: email, password: 'whatever')
  login_as user
end