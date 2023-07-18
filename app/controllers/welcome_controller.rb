class WelcomeController < ApplicationController
  def index
    @users = User.all
  end

  def logout
    session.delete(:user_id) 
    redirect_to '/'
  end
end