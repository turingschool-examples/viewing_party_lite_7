class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movid_id])
    @users = User.all
    # require 'pry'; binding.pry
  end

  def create
    movie = find_movie

    require 'pry'; binding.pry
    if params[:duration].to_i < movie[:runtime]
      flash[:alert] = "Party must be as long or longer than movie"
      redirect_back(fallback_location: "/users/#{params[:user_id]}/movies/#{movie[:id]}/new")
    else
      @party = Party.new({
          movie_id: params[:movid_id],
          movie_title: movie[:title],
          duration: params[:duration],
          date: params[:date],
          # start_time: params[:start_time],
          name: params[:name]
        })
      if @party.save
        redirect_to "/users/#{params[:user_id]}/movies/#{movie[:id]}/view_party"
      else
        flash[:alert] = "Please fill in the field correctly"
        redirect_back(fallback_location: "/users/#{params[:user_id]}/movies/#{movie[:id]}/new")
      end
    end
  end

  private 

  def find_movie
    MovieFacade.movie_details(params[:movid_id])
  end

  def party_params
    params.permit(:movid_id, :title, :duration, :date, :name)
  end
end
