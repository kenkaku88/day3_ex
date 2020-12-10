require 'selenium-webdriver'
require 'webdrivers'

Given('Brow to login pages') do
    @driver = Selenium::WebDriver.for :chrome
    # Navigate to URL
    @driver.get 'http://the-internet.herokuapp.com/login'
    @driver.manage.window.maximize
  end
  
  When('Login with valid user {string} and  valid password {string}') do |string, string2|
    @driver.find_element(:xpath, "//input[@id='username']").send_keys(string)
    @driver.find_element(:xpath, "//input[@id='password']").send_keys(string2)
    sleep 2
    @driver.find_element(:xpath, "//i[contains(text(),'Login')]").click
  end
  
  Then('Login successful') do
    notifi = @driver.find_element(:xpath, "//div[@id='flash']").text
    expect(notifi).to eq("You logged into a secure area!\n×")
  end
  
  When('Login with invalid user {string} and  valid password {string}') do |string, string2|
    @driver.find_element(:xpath, "//input[@id='username']").send_keys(string)
    @driver.find_element(:xpath, "//input[@id='password']").send_keys(string2)
    sleep 2
    @driver.find_element(:xpath, "//i[contains(text(),'Login')]").click
  end
  
  Then('Notification content {string} is showed') do |string|
    notifi = @driver.find_element(:xpath, "//div[@id='flash']").text
    expect(notifi).to eq(string)
  end
