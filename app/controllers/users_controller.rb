require 'faraday'
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    @viewing_users = @user.viewing_users
    @host = @viewing_users.where(host: "YES")
    if @user.viewing_parties.count >= 1
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.headers["Authorization"] = ENV["api_access_key"]
      end
      response = conn.get("/3/search/movie/#{@viewing_parties[0].api_movie_id}")
      data = JSON.parse(response.body, symbolize_names: true)
      @movie = PopularMovie.new(data)
    end
  end

  def new
  end

  def create
    if params[:password] != params[:password_confirmation]
      flash[:error] = "Invalid email or password"
      redirect_to new_user_path
    else
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome #{@user.name}, you have sucussfully registered"
        redirect_to user_path(@user.id)
      else
        flash[:error] = "Invalid email or password"
        redirect_to new_user_path
      end
    end
  end

  def login_form
  end

  def login
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      # session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      user_path(user.id)
    else
      flash[:error] = "Invalid login credentials, please try again"
      render :login_form
    end

  end

  private

  def user_params
    params.permit(:email, :name, :password)
  end

  # def user_params
  #   params.require(:user).permit(:email, :name, :password)
  # end
end
