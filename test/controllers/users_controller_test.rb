require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "a user sees their own dashboard after signing in" do
    user = FactoryGirl.create(:user)
    sign_in user
    # Triggers the page
    get :show, :id => user.id
    # Verifies that the page loads successfully
    assert_response :success
  end
end
