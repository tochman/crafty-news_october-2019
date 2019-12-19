# frozen_string_literal: true

require 'cucumber/rails'
require 'coveralls'
Coveralls.wear_merged!('rails')

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Webdrivers::Chromedriver.required_version = 2.44
chrome_options = %w[ headless
                     no-sandbox
                     disable-popup-blocking
                     disable-gpu
                     disable-infobars
                     disble-dev-shm-usage
                     auto-open-devtools-for-tabs]

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: chrome_options)

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.server = :puma
Capybara.javascript_driver = :chrome

World FactoryBot::Syntax::Methods
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  Warden.test_mode!
  StripeMock.start
end

World Warden::Test::Helpers
After do
  Warden.test_reset!
  StripeMock.stop
end
