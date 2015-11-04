require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "an admin can view categories" do
    create_admin

    visit admin_categories_path

    assert_equal admin_categories_path, current_path

    assert page.has_content?('All Mah Categories')
  end

  test "non admin cannot view categories" do
    user = User.create(username: 'rossedfort',
                       password: 'password',
                       role: 0
                      )

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path

    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test "an admin can create a category" do
    create_admin

    visit admin_categories_path


    click_link new_admin_category_path

    fill_in 'Name', with: 'rock'
    click_button 'Create Category'

    assert page.has_content?('New Category Added!')
  end

end
