class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
    # @top_rated_movies = MoviesService.new.top_rated
  end

  def movies
    @user = User.find(params[:user_id])
    query = params[:q]

    @title = if query == 'top_rated'
               'Top Rated Movies'
             elsif query.present?
               "Search Results for '#{query}'"
             else
               'Error: No Query'
             end

    movies_data = if query == 'top_rated'
                    MoviesService.new.top_rated.first(20)
                  elsif query.present?
                    MoviesService.new.search(query).first(20)
                  else
                    []
                  end

    @movies = movies_data.map { |movie_data| Movie.new(movie_data) }
  end

  def movie_show
    @user = User.find(params[:user_id])
    @movie = facade.find_movie(params[:movie_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def facade
    @facade ||= MoviesFacade.new
  end
end
