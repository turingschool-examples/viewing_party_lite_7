class MovieController < ApplicationController
  before_action :find_user, only: [:index, :results]

  def index
  end

  def results
    @movies = MovieFacade.new.get_results(params[:q])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end