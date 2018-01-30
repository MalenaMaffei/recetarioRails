require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
      @email = "ABC@gmail.com"
      @user = User.new(:username => 'TestName', :email => @email)
      @user.run_callbacks(:save) { false }
      # @recipe.token = 'abc'
    end
  test "user email should be lowercase" do
    assert_not @user.email == @email
  end
end
