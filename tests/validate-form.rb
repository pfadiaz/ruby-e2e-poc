require 'rspec/autorun'
require_relative '../fixtures/selectors'
require_relative '../fixtures/test-data'
require_relative '../utils/api/get-user-endpoint'

test_data = TestData.new()
api = User.new()
browser = FormPageElements.new()


RSpec.describe "Test Suite that verifies the user interaction with the form" do

  before (:all) { browser.open(test_data.url) }
  after (:all) { browser.close_browser }

  it "gets the first name and last name from endpoint" do
    browser.first_name.send_keys(api.get_first_name)
    browser.last_name.send_keys(api.get_last_name)
  end

  it "fills in the email, phone, address, city, zip code" do
    browser.email.send_keys(test_data.user_email)
    browser.phone.send_keys(test_data.user_phone_number)
    browser.address.send_keys(test_data.user_address)
    browser.city.send_keys(test_data.user_city)
    browser.zip.send_keys(test_data.user_zip_code)
  end

  it "select Florida from the state dropdown" do
    browser.state(test_data.user_state_address)
  end

  it "gets the current URL and use it in the website field" do
    browser.website.send_keys(browser.get_url)
  end

  it "clicks no for the hosting option" do
    browser.hosting_radio_no.click()
  end

  it "gets the outliner from the array 1 [22, 24, 0, 100, 4, 111, 2602, 18] and array 2 [60, 33, 1719, 25, 19, 13, -21]" do
    browser.project_description(test_data.array_puzzle_one, test_data.array_puzzle_two)
  end

    it "clicks the send button and checks if an exception comes up during the process" do
      expect { browser.send_button.click() }.not_to raise_error
    end
end








