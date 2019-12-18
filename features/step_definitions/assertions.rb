# frozen_string_literal: true

Then('I should see {string}') do |content|
  expect(page).to have_text content
end
Then("I should not see {string}") do |content|
  expect(page).not_to have_text content
end

Then('I should be on the {string} page') do |article_title|
  article = Article.find_by(title: article_title)
  expect(current_path).to eq article_path(article)
end

Then('I should be on the login page') do
  expect(current_path).to eq new_user_session_path
end

Then('I should be on the edit page for {string}') do |article_title|
  article = Article.find_by(title: article_title)
  expect(current_path).to eq edit_article_path(article)
end

Then("I should be on the purchase subscription page") do
  expect(current_path).to eq new_subscription_path
end
