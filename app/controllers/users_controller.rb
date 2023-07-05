class UsersController < ApplicationController
  def show; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user.id)
    else
      flash[:error] = "'Name' and 'Email' fields are required, please try again."
      redirect_to register_index_path
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
