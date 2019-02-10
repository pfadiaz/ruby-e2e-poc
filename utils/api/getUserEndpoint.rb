require 'net/https'
require 'json'
require_relative '../../fixtures/test-data'

class User
  def get_user_from_endpoint()
    test_data = TestData.new()
    uri = URI(test_data.endpoint)
    endpoint_response = Net::HTTP.get_response(uri)
    @user_name = JSON.parse(endpoint_response.body)['name']
    return @user_name
  end
  def get_first_name()
    get_user_from_endpoint()
    first_name = @user_name.split(" ")[0]
    return first_name
  end
  def get_last_name()
    get_user_from_endpoint()
    last_name = @user_name.split(" ")[1]
    return last_name
  end
end