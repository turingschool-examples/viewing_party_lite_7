# frozen_string_literal: true

class MoviesController < ApplicationController
  def index # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    @user = User.find(params[:user_id])

    if params[:top_movies] == 'top rated'
      @facade = Top20Facade.new(params[:top_movies])
    elsif params[:commit] == 'Find Movies'
      if !params[:search].empty?
        @facade = MovieSearchFacade.new(params[:search])
      elsif params[:search].empty?
        redirect_to discover_user_path(@user)
        flash[:error] = "Please fill in with a movie title"
      end
    end
  end

  def show
    @facade = MovieDetailsFacade.new(params[:id])
    @user = User.find(params[:user_id])
  end
end
