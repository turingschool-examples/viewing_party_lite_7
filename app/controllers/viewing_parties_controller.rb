class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new
    @movie = params[:movie_data]
  end

  def create
    @user = User.find(params[:user_id])
    @viewing_party = @user.viewing_parties.new
    runtime = params[:runtime]

    if params[:duration_minutes].to_i >= runtime.to_i

      @viewing_party.save
   
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "Duration cannot be less than runtime - #{runtime} minutes"
      # render :new, locals: { movie_data: params[:movie_data] }
    end
  end
end