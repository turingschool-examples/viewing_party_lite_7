class UserController < ApplicationController
  def dashboard
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
  end
end