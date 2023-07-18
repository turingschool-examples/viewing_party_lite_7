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
  
  # def login_form
  # end

  # def login
  #   if params[:email] == ""
  #     flash[:error] = "Invalid email or password"
  #     redirect_to login_path
  #   else
  #     @user = User.find_by(email: params[:email])
  #     if @user.authenticate(params[:password])
  #       session[:user_id] = @user.id
  #       flash[:success] = "Welcome, #{@user.name}!"
  #       redirect_to user_path(@user.id)
  #     else
  #       flash[:error] = "Invalid email or password"
  #       redirect_to login_path
  #     end
  #   end
  # end

  private

  def user_params
    params.permit(:email, :name, :password)
  end

  # def user_params
  #   params.require(:user).permit(:email, :name, :password)
  # end
end
