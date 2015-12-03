require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test 'a user can add a comment on a place\'s page' do
    user = FactoryGirl.create(:user)
    sign_in user
    place = FactoryGirl.create(:place)
    post :create, :place_id => place.id,
      :comment => {
        :message => 'The best pizza of all time!',
        :rating => 'five stars'
      }
    assert_equal 1, place.comments.count
    assert_redirected_to place_path(place.id)
  end
end
