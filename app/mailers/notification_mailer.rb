class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added(comment)
    # Get the place the comment was made for.  *** Since we are passing in a specific comment, we need to access the owning place through this comment, hence we must use "comment.place" to do this (we can't use places.find(:id).comment. We are going from the comment to the place (climbing up)), not from the place to the comment (climbing down). ***
    @place = comment.place
    # Use this place we found from the comment to find the user that the place belongs to (climbing up another level).
    @place_owner = @place.user
    mail(to: @place_owner.email, subject: "A comment has been added to #{@place.name}")
  end
end
