class UserController < ApplicationController
  def new

  end

  private
  def user_params
    params.permit(:name, :email)
  end
end