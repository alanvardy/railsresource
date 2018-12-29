ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # Add more helper methods to be used by all tests here...

  class ActionDispatch::IntegrationTest
    def login_user
      post session_index_path, params: { admin: { username: 'foo', password: 'bar' } }
    end
  end
end
