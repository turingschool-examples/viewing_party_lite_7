require 'faraday'
class UsersController < ApplicationController
  def show
    if current_user
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
    else
      flash[:error] = "You must login or register to view this page"
      redirect_to root_path
    end
  end

  private
  # def user_params
  #   params.require(:user).permit(:email, :name, :password)
  # end

  def user_params
    params.permit(:email, :name, :password)
  end
end
