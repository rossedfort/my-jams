ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest/pride'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    user = User.create(username: 'rossedfort',
                       password: 'password'
                       )
    artist = Artist.create(name: Faker::Name.name)
    @song = Song.create(title: Faker::Lorem.word,
                       artist_id: artist.id,
                       user_id: user.id)
  end

  def teardown
    reset_session!
  end

  def login_user
    User.create(username: 'rossedfort',
                password: 'password'
                )

    visit login_path

    fill_in 'Username', with: 'rossedfort'
    fill_in 'Password', with: 'password'
    click_button 'Login'
  end

  def create_admin
    admin = User.create(username: 'rossedfort',
                        password: 'password',
                        role: 1
                        )

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
  end
end
