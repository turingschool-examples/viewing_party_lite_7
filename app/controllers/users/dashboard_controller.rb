class User::DashboardController < ApplicationController
  
  def index
    @users = User.all
  end
end
