class UsersController < ApplicationController
  def new
  end

  def show
    @facade = UsersFacade.new(params)
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end