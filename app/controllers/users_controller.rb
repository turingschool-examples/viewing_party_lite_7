class UsersController < ApplicationController
  def new 
    
  end

  def dashboard
    @user = User.find(params[:id])
  end

end