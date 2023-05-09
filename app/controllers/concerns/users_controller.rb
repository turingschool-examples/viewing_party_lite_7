class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @viewing_parties = ViewingParty.all
  end

  def new

  end

end
