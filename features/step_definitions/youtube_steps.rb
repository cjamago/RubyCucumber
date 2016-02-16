Given(/^I'm on "([^"]*)" page$/) do |path_to|
  visit path_to
end


When(/^I type "([^"]*)" in search field$/) do |search_text|
  find(:id, "masthead-search-term").set search_text
  find(:id, "search-btn").click
end


Then(/^I should see "([^"]*)" in result$/) do |expectation|
  page.should have_content expectation
end
