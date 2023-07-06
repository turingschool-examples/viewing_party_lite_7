class SearchController < ApplicationController

  def search
    movie_search = params[:search]
    user = User.find(params[:user_id])

    redirect_to movies_path(user)
  end

end