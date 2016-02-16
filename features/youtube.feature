Feature: As a customer, I want to search something on the Youtube

  Scenario: Search something on the Youtube
    Given I'm on "https://www.youtube.com" page
    When I type "Install Cucumber Ruby Capybara" in search field
    Then I should see "Install Selenium Ruby Capybara step by step" in result