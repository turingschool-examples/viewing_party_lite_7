class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user), notice: "User created successfully"
    else
      flash.now[:alert] = user.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    # conduct api call to get movie poster here
    @parties = @user.viewing_parties
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
