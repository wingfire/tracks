Given /^I have logged in as "(.*)" with password "(.*)"$/ do |username, password|
  visit login_path
  fill_in "Login", :with => username
  fill_in "Password", :with => password
  click_button
  if response.respond_to? :selenium
    selenium.wait_for_page_to_load(5000)
    # when logging in using only webrat, the session seems stored and tracks
    # welcomes the user back while using selenium, the session is not stored and
    # the user logs in for the first time, thus a different message
    response.should contain(/Login successful/)
  else
    response.should contain(/Logged in successfully/)
  end
  @current_user = User.find_by_login(username)
end

When /^I submit the login form as user "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  fill_in 'Login', :with => username
  fill_in 'Password', :with => password
  click_button
end
