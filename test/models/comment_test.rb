require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "new rating is humanized with the expected format" do
    comment = Comment.new(:rating => '1_star').humanized_rating
    # assert_equal(expected, actual)
    assert_equal 'one star', comment
  end
end
