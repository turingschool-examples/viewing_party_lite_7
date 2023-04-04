class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @_current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # def authorization
  #   if current_user
  #   user = User.find(params[:id])
  #   if user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     @user ||= current_user
  #   else
  #     flash[:message] = "You must be logged in or registered to access the dashboard."
  #     redirect_to "/"
  #   end
  # end
end
