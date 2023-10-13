class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    # poster_base_url = ThemoviedbService.poster_image_base_url[:base_url]
    # size = ThemoviedbService.poster_image_base_url[:logo_sizes][1]
    # ThemoviedbService.movie_details
    @hosted_viewing_parties = ViewingParty.where(host_user_id: @user.id)
    @invited_viewing_parties = @user.viewing_parties
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end