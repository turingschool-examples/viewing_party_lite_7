class ViewingPartiesController < ApplicationController
  before_action :find_movie

  def new
    @users = User.where("id !=  ?", params[:id])
  end

  def create
    viewing_party = ViewingParty.new({
      duration: params[:duration],
      day: params[:day],
      view_time: params[:view_time],
      movie_id: @movie.id
    })
    
    if viewing_party.duration < @movie.runtime
      flash[:error] = "Viewing party duration can not be less than the run time of the movie. Please try again."
      redirect_to "/users/#{params[:id]}/movies/#{@movie.id}/viewing_party/new"
    else
      viewing_party.save
      UserViewingParty.create(user: User.find(params[:id]), viewing_party: viewing_party, host: true)
      
      User.all.each do |user|
        if params["#{user.name}"] == "1"
          UserViewingParty.create(user: user, viewing_party: viewing_party, host: false)
        end
      end

      redirect_to "/users/#{params[:id]}"
    end

    
  end

  private

  def find_movie
    @movie = facade.movie
  end

  def facade
    MovieFacade.new(params[:movie_id])
  end
end