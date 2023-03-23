class UsersController <ApplicationController
  def show 
    @user = User.find(params[:id])
  end

  def new

  end

  def create
    user = User.create_new_user(user_params)
    if user.save
      redirect_to user_path(user)
    else
      flash[:error] = "Error: Invalid form entry"
      redirect_to "/register"
    end
  end

  def discover
    
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end