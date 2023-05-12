class Users::Movies::ViewingPartiesController < ApplicationController
  before_action :get_user
  def new
    @facade = MovieFacade.new(params[:movie_id])
    @users = User.other_users(@user.id)
  end

  def create
    party = Party.new(party_params)
    if party.save
      create_user_parties(params[:invite], party.id)
      create_host_party(@user.id, party.id)
      redirect_to user_path(@user)
    else
      flash[:error] = 'Please fill out all fields'
      redirect_to new_user_movie_viewing_party_path(@user, params[:movie_id])
    end
  end

  private
    def get_user
      @user = User.find(params[:user_id])
    end

    def party_params
      params.permit(:duration, :date, :start_time, :movie_id)
    end

    def create_host_party(uid, pid)
      UserParty.create(user_id: uid, party_id: pid, is_host: true)
    end

    def create_user_parties(ids, pid)
      if ids.present?
        ids.each do |id|
          UserParty.create(user_id: id, party_id: pid)
        end
      end
    end
end