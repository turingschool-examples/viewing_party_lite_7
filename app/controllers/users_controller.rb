class UsersController < ApplicationController
  def new
    
  end
endclass UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end