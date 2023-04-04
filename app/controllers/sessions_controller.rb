class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    redirect_to '/', notice: 'You have been logged out'
  end
end