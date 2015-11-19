class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    # 1) A place has_many comments.
    # 2) The merge method combines two hash tables.  Here, the comment_params hash { :message => 'This place rocks!', :rating => '5_stars' } is merged with { :user => current_user }.  We're doing this so that the user who creates a comment is associated with it by adding that user as a comment attribute.
    @place.comments.create(comment_params.merge(:user => current_user))
    redirect_to place_path(@place)
  end

  private

  def comment_params
    # Pull data out of the comments form, using extracted URL parameters.
    params.require(:comment).permit(:message, :rating)
  end
end
