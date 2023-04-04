class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success, :notice

  private

  def error_message(errors)
    errors.full_messages.join(", ")
  end

  def require_user
    if session[:user_id] != params[:id].to_i
      flash[:error] = "You must be logged in to view this page!"
      redirect_to root_path
    end
  end
end
