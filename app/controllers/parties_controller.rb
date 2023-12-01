class PartiesController < ApplicationController
  
  def new
    @movie = Movie.details(params[:movie_id])
    @user = User.find(params[:user_id])
  end

  def create
    if Movie.where("tmdb_id = ?", params[:movie_id]).count > 0
      @movie = Movie.where("tmdb_id = ?", params[:movie_id]).first
    else
      @movie = Movie.create_from_api(params[:movie_id])
    end
    @user = User.find(params[:user_id])
    new_party = Party.new(parties_params)

    if new_party.duration < @movie.runtime
      flash[:notice] = "Party Duration Must Be Longer Than Movie Runtime"
      redirect_to "/users/#{@user_id}/movies/(#{@movie_id})/viewing-party/new"
    elsif new_party.save
      UserParty.create!({
        user_id: @user.id,
        party_id: new_party.id,
        creator: true
      })
      params.each do |param|
        if param[0].to_i != 0 && param[1].to_i == 1
          UserParty.create!({
            user_id: param[0].to_i,
            party_id: new_party.id,
            creator: false
          })
        end
      end

      redirect_to "/users/#{@user.id}"
    else
      # flash[:notice] = "Party already created"
      # redirect_to "/users/#{@user.id}/movies/#{new_party.movie_id}/viewing-party/new"
    end
  end

  private
  def parties_params
    params[:date] = Party.formatted_date(params)
    params[:start_time] = Party.formatted_time(params)
    params[:name] = @movie.title
    params[:movie_id] = @movie.id
    params.permit(:start_time, :name, :duration, :date, :movie_id)
  end

end