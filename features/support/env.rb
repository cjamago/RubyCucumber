require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

include RSpec::Matchers

path = File.dirname(__FILE__)

Capybara.configure do |capybara|

  capybara.register_driver :selenium_firefox do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end

  capybara.register_driver :selenium_chrome do |app|
    Selenium::WebDriver::Chrome.driver_path = "#{path}/bin/chromedriver"
    profile = Selenium::WebDriver::Chrome::Profile.new
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  capybara.register_driver :selenium_safari do |app|
    Capybara::Selenium::Driver.new(app, :browser => :safari)
  end

  capybara.register_driver :selenium_ie do |app|
    Capybara::Selenium::Driver.new(app, :browser => :ie)
  end

  capybara.register_driver :selenium_phantomjs do |app|
    Selenium::WebDriver::PhantomJS.path = "#{path}/bin/phantomjs"
    Capybara::Selenium::Driver.new(app, :browser => :phantomjs)
  end

  capybara.default_driver = :selenium_chrome
  capybara.run_server =false

end

RSpec.configure do |config|
  config.include Capybara::DSL
end