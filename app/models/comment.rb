class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

# User sees the key in the form, while the value is stored in the database.
  RATINGS = {
    'one star'    => '1_star',
    'two stars'   => '2_stars',
    'three stars' => '3_stars',
    'four stars'  => '4_stars',
    'five stars'  => '5_stars'
  }

  def humanized_rating
    # In the place show page, <%= comment.rating %> would display the selected hash value (after using the drop down input) from the RATINGS chart, which is not great.  We'd rather display the keys, which can be altered at will, while the values in this hash are stored in the database and must be left alone to avoid later pain.
    # Invert the keys and values of the RATINGS hash, then access the value within the inverted hash that corresponds to the current instance of Comment.rating:
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
end
