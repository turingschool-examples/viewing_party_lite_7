class UserViewingPartiesController < ApplicationController

  def create
    user = User.find(params[:user_id])
    if params[:user_ids]
      params[:user_ids].each do |user_id|
        user_viewing_party = UserViewingParty.new(user_id: user_id, viewing_party_id: params[:viewing_party_id])
        user_viewing_party.save
      end
      redirect_to user_path(user)
    else
      flash[:custom_message] = "Creation unsuccessful. Your viewing party can't take less time than the movie!"
      redirect_to "/users/#{@user.id}/movies/#{@details.id}/viewing-party/new"
    end
  end
end