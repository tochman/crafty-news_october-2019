Then("I should see {string}") do |content|
  expect(page).to have_text content
end

Then("I should be on the {string} page") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end