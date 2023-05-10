class UsersController < ApplicationController

  def new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

   def show
    @user = User.find(params[:id])
    @viewing_parties = ViewingParty.find_viewing_parties(@user)
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end
