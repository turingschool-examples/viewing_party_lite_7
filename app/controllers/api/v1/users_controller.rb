module Api
  module V1
    class UsersController < ApplicationController
      def show
        @user = User.find(params[:id])
        @viewing_parties = @user.viewing_parties
      end
      
      def new
      end

      def create
        @user = User.new(user_params)

        if @user.save
          redirect_to user_path(@user)
        else
          render :new
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email)
      end
    end
  end
end


