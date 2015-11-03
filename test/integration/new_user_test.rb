require 'test_helper'

class NewUserTest < ActionDispatch::IntegrationTest
  test "guest can create a new user" do
    visit new_user_path
    
    fill_in 'Username', with: 'rossedfort'
    fill_in 'Password', with: 'password'
    click_button 'Create Account'

    assert page.has_content?("Welcome rossedfort")
  end
end
