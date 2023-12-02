class ApplicationController < ActionController::Base

  def current_user
    if User.all == []
      redirect_to register_path
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  helper_method :current_user

  private
  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
