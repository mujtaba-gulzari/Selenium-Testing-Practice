#This is a practice test automation for a web blog called "Selenium Blog".
#I have followed a paid course to learn Selenium test automation
require "selenium-webdriver"
require "rspec"
require_relative "signup_page.rb"
require_relative "user_page.rb"

timestamp = Time.now.to_i
username = "mujtaba #{timestamp}"
email = "mujtaba#{timestamp}@test.com"
password = "gabageebabo"
expected_banner_text = "Welcome to the alpha blog mujtaba #{timestamp}"


# TEST: Sign up for blog
describe "Blog application" do
  describe "signup to the blog application" do
    it "confirm that a user can successfully signup" do
      @driver = Selenium::WebDriver.for :firefox
  		# Go to signup form
  		@driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
  		# Fill out and submit form
  		signup = SignupPage.new(@driver)
      signup.enter_username(username)
      signup.enter_email(email)
  		signup.enter_password(password)
  		signup.submit_form()

  		# Confirm user is signed up successfully
      users = UsersPage.new(@driver)
  		banner_text = users.get_banner_text()
  		expect(banner_text).to eq(expected_banner_text)

  		@driver.quit
	  end
  end
end
