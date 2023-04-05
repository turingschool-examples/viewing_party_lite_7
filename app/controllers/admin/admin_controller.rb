class Admin::AdminController < ApplicationController 
  # before_action :require_admin
  before_action :not_authorized

  def show 
    @users_list = User.only_default_users
  end

  private 
    # def require_admin 
    #   render file: "/public/404.html" unless current_admin?
    # end

    def not_authorized 
      unless current_admin?
        redirect_to root_path
        flash[:alert] = "You are not authorized to access this page"
      end
    end
end