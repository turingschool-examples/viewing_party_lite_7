class UsersController < ApplicationController 
    def index 
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @viewing_parties = @user.invited_viewing_parties
    end

    def new 
       
    end

    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to user_path(@user)
        else 
          flash[:alert] = "Please fill in all fields."
          render :new
        end
    end

    private

  def user_params
    params.permit(:name, :email)
  end
end