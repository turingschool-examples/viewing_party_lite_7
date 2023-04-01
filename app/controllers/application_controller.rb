# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def require_user
    if session[:user_id] != params[:id].to_i
      flash[:error] = "Log in to view this page"
      redirect_to root_path
    end
  end
end
