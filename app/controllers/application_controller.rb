# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authenticate_user!

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authenticate_user!
    unless current_user
      redirect_to root_path, alert: 'You must be logged in or registered to access this page.'
    end
  end
end