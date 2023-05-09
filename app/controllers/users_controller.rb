class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @viewing_parties = ViewingParty.find_viewing_parties(@user)
    # require 'pry'; binding.pry
  end

end
