class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new 
    
  end
  
  def create
    #reroute to dashboard page with user/id show page
  end
end
