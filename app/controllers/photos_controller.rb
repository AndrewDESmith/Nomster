class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.new
  end

  def create
    @place = Place.find(params[:place_id])
    @photo = @place.photos.create(photo_params)
    if @photo.valid?
      flash[:success] = "Photo added."
      redirect_to place_path(@place)
    else
      flash[:error] = "You need to include a photo and a caption."
      redirect_to place_path(@place)
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @photo = @place.photos.find(params[:id])

    if @place.user != current_user
      return render :text => 'Not allowed', :status => :forbidden
    end

    @photo.destroy
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:photo).permit(:picture, :caption)
  end
end
