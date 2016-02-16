require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/dsl'

include RSpec::Matchers

$timeout = 50

Capybara.configure do |capybara|

  capybara.register_driver :selenium_ff do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end

  capybara.register_driver :selenium_ie do |app|
    Capybara::Selenium::Driver.new(app, :browser => :ie)
  end

  capybara.default_driver = :selenium_ff
  capybara.run_server =false

end

RSpec.configure do |config|
  config.include Capybara::DSL
end