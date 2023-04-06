class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @_current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorization
    if current_user.nil?
      flash[:message] = "You must be logged in or registered to continue."
      redirect_to "/"
    end
  end
end