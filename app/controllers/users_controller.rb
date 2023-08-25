class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @movies = {}
    @movie_images = {}
    @hosted_parties = []
    @invited_parties = []

    @user.viewing_parties.each do |party|
      if party.party_guests.find_by(user_id: @user.id, host: true)
        @hosted_parties << party
      else
        @invited_parties << party
      end

      movie_id = party.movie_id
      movie = MoviesService.new.find_movie(movie_id)
      @movies[movie_id] = movie.title
      @movie_images[movie_id] = movie.image
    end
  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully registered.'
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

  def discover
    @user = User.find(params[:user_id])
    @top_rated_movies = MoviesService.new.top_rated
  end

  def movies
    @user = User.find(params[:user_id])
    query = params[:q]

    movies_data = if query == 'top_rated'
                    MoviesService.new.top_rated
                  elsif query.present?
                    MoviesService.new.search(query)
                  else
                    []
                  end

    @movies = movies_data.map { |movie_data| Movie.new(movie_data) }
    @title = if query == 'top_rated'
               'Top Rated Movies'
             elsif query.present?
               "Search Results for '#{query}'"
             else
               'Error: No Query'
             end
    @movies = movies_data.map { |movie_data| Movie.new(movie_data) }
  end

  def movie_show
    @user = User.find(params[:user_id])
    @movie = MoviesService.new.find_movie(params[:movie_id])
    # @movie = find movie in 'cached' movie facade?
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
