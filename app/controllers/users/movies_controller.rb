class Users::MoviesController < ApplicationController
  def index
    @facade = MoviesFacade.new(params)
  end

  def show
    @facade = MoviesFacade.new(params)
  end
end