class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    user_all_parties = @user.parties

    @all_parties_and_movie = []

    user_all_parties.each do |party|
      @all_parties_and_movie << party.get_all_info
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "#{user.name} has been created!"
      # redirect_to root_path
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.to_sentence
      # redirect_to register_path
      redirect_to "/register"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
