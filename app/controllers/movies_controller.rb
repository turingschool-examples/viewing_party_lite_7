class MoviesController < ApplicationController
  def index
    @users = User.all #find specific user?
  end
end