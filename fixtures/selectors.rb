require 'selenium-webdriver'
require_relative '../utils/puzzle/generateOutliner'

class FormPageElements

  def open(url)
     @driver = Selenium::WebDriver.for :firefox
     @driver.navigate.to(url)
     @driver.manage.window.maximize
  end
  def first_name()
    return @driver.find_element(:name, 'first_name')
  end

  def last_name()
    return @driver.find_element(:name, 'last_name')
  end

  def email()
    return @driver.find_element(:name, 'email')
  end

  def phone()
    return @driver.find_element(:name, 'phone')
  end

  def address()
    return @driver.find_element(:name, 'address')
  end

  def city()
    return @driver.find_element(:name, 'city')
  end

  def state(state_name)
    dropdown_selector = @driver.find_element(:name, 'state')
    value_selection = Selenium::WebDriver::Support::Select.new(dropdown_selector)
    return value_selection.select_by(:text, state_name)
  end

  def zip()
    return @driver.find_element(:name, 'zip')
  end

  def website()
    return @driver.find_element(:name, 'website')
  end

  def hosting_radio_no()
    return @driver.find_element(:xpath, '//input[@name="hosting" and @value="no"]')
  end

  def project_description(number_Set_1,number_Set_2)
    puzzle_numbers=Puzzle.new()
    outliner_1=puzzle_numbers.get_odds_and_evens(number_Set_1)
    outliner_2=puzzle_numbers.get_odds_and_evens(number_Set_2)
    return @driver.find_element(:name, 'comment').send_keys(outliner_1, ' and ', outliner_2)
  end

  def get_url()
    return @driver.current_url
  end

  def send_button()
    return @driver.find_element(:xpath, '//button[@type="submit"]')
  end

  def close_browser()
    @driver.quit
  end
end