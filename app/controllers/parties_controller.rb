class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
    # require 'pry'; binding.pry
  end

  def create
    movie = find_movie
    user_host = User.find(params[:user_id])

    if params[:duration].to_i < movie[:runtime]
      flash[:alert] = "Party must be as long or longer than movie"
      redirect_back(fallback_location: "/users/#{params[:user_id]}/movies/#{movie[:id]}/new")
    else
      @party = Party.new({
          movie_id: params[:movie_id],
          movie_title: movie[:title],
          duration: params[:duration],
          date: params[:date],
          start_time: format_time(params["start_time(4i)"], params["start_time(5i)"]),
          name: params[:name]
        })
      if @party.save
        UserParty.create(user_id: user_host.id, party_id: @party.id, host: true)

        User.all.each do |user|
          next if user == user_host
          UserParty.create(user_id: user.id, party_id: @party.id, host: false) if params[user.name] == "1"
        end
        redirect_to user_path(params[:user_id])
      else
        flash[:alert] = "Please fill in the field correctly"
        redirect_back(fallback_location: "/users/#{params[:user_id]}/movies/#{movie[:id]}/new")
      end
    end
  end

  private 

  def find_movie
    MovieFacade.movie_details(params[:movie_id])
  end

  def party_params
    params.permit(:movie_id, :title, :duration, :date, :name)
  end

  def format_time(hour, min)
    "#{hour}:#{min}"
  end
end
