require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest
  test "registered user can create login" do
    login_user

    assert page.has_content?("Welcome rossedfort")
  end

  test "unregistered user cannot login" do
    visit login_path

    fill_in 'Username', with: 'Not_A_User'
    fill_in 'Password', with: 'whatever'
    click_button 'Login'

    assert page.has_content?("This Account Doesn't Match Our Records")
  end

  test "registered user cannot login with improper password" do
    user = User.create(username: 'rossedfort',
                       password: 'password'
                       )
    visit login_path

    fill_in 'Username', with: 'rossedfort'
    fill_in 'Password', with: "not_ross'_password"
    click_button 'Login'

    assert page.has_content?("This Account Doesn't Match Our Records")
  end
end
