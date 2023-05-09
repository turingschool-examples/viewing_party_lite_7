class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = ViewingParty.joins(:viewing_party_users).where(user_id: @user.id)
    # require 'pry'; binding.pry
  end

end
