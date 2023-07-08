class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @viewing_parites=@user.viewing_parites
  end

  def create
  end
end
