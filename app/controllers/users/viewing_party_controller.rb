class Users::ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.new(params).search
    @user = User.find(params[:user_id])
  end

  
end