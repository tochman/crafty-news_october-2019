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
  user = User.find_by(email: email) || create(:user, email: email, password: 'whatever') 
  login_as user
end

Then("show me the page") do
  save_and_open_page
end

Given("I am on the edit page for {string}") do |article_title|
  article = Article.find_by(title: article_title)
  visit edit_article_path(article)
end


Given("I fill in the Stripe form field {string} with {string}") do |field_name, value|
  case field_name
  when "Card number"
    stripe_field_name = "cardnumber"
  end
  stripe_iframe = find("iframe[name='__privateStripeFrame4']")
  within_iframe(stripe_iframe) do
    find_field(stripe_field_name).send_keys(value)
  end
end