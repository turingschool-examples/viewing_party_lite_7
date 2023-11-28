class UserPartiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @parties = @user.user_parties
  end
end