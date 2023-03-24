# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name} has been Created!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @viewing_parties = @user.viewing_parties
    # binding.pry
    @facade = MovieFacade.new(params)
    @other_users = User.other_users(@user.id)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
