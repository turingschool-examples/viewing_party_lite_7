# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_user, only: :index

  def index
    require 'pry'; binding.pry
    @movies = MovieFacade.top_movies
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
