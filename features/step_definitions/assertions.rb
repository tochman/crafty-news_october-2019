Then("I should see {string}") do |content|
  expect(page).to have_text content
end