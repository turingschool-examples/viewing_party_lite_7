class Users::ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.new(params).search
    @user = User.find(params[:user_id])
    @users = User.where.not(id: @user.id)
  end

  

  
end