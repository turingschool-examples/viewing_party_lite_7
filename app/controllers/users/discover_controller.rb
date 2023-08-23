Users::Discover < ApplicationsControllers

def index
  @user = User.find(params[:id])
end