# frozen_string_literal: true

Given("I am on the index page") do
  visit root_path
end

When('I fill in {string} with {string}') do |input, content|
  fill_in input, with: content
end

When('I click on {string}') do |element|
  click_on element
end

Given('I am logged in as {string}') do |email|
  user = User.find_by(email: email) || create(:user, email: email, password: 'whatever')
  login_as user
end

Then('show me the page') do
  save_and_open_page
end

Then('stop') do
  binding.pry
end

Given('I am on the edit page for {string}') do |article_title|
  article = Article.find_by(title: article_title)
  visit edit_article_path(article)
end

Given('I fill in the Stripe form field {string} with {string}') do |field_name, value|
  case field_name
  when 'Card Number'
    stripe_iframe_name = '#card-number div iframe'
    stripe_field_name = 'cardnumber'
  when 'Expiry date'
    stripe_iframe_name = '#card-expiry div iframe'
    stripe_field_name = 'exp-date'
  when 'CVC'
    stripe_iframe_name = '#card-cvc div iframe'
    stripe_field_name = 'cvc'
  end
  within_frame(find(stripe_iframe_name)) do
    page.driver.browser.find_element(name: stripe_field_name).send_keys(value)
  end
end

Then('wait {int} seconds') do |int|
  sleep int
end
