require 'test_helper'

class LogoutUserTest < ActionDispatch::IntegrationTest
  test "a logged in user can log out" do
    login_user

    assert page.has_content?('Welcome rossedfort')

    click_link 'Logout'

    assert page.has_content?('Goodbye')
  end
end
