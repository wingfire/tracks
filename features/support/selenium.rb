if ENV["RAILS_ENV"] == "selenium"
  puts "Configuring to use Selenium with WebRat for Cucumber stories"
  Webrat.configure do |config|
    config.mode = :selenium
    config.open_error_files = false
    config.application_environment = :selenium
    config.selenium_browser_startup_timeout = 30
    # only set if you do not want cucumber/webrat to start selenium-server for you
    # config.selenium_server_address = "localhost"
  end

  Cucumber::Rails::World.use_transactional_fixtures = false
end