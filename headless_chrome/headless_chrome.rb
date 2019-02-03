require "chromedriver-helper"
require "selenium-webdriver"
# If you're working on with Gemfile, remove above and add below in Gemfile instead:
# gem 'chromedriver-helper'
# gem 'selenium-webdriver'

class Screenshot
  def self.call(url, path = "#{File.expand_path('sample.png',__dir__)}")
    # boot Chrome
    initialize

    # navigate to a really super awesome blog
    @driver.navigate.to url

    # resize the window and take a screenshot
    @driver.manage.window.resize_to(1440, 1260)
    @driver.save_screenshot path

    # shut down
    finalize
  end

  private

  def self.initialize
    # configure the driver to run in headless mode
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    @driver = Selenium::WebDriver.for :chrome, options: options
  end

  def self.finalize
    @driver.quit
  end
end
