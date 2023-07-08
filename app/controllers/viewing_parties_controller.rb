class ViewingPartiesController < ApplicationController
  require 'pry'; binding.pry
  before_action :find_user

  def new
    @movie = MovieFacade.get_movie(params[:movie_id])
    @users = User.other_users(@user.id)
  end

  def create
    movie_party = Party.new(party_params)
    binding.pry
    if movie_party.save
      #create userparty between each user_id and movie_id, is_host: false
      #if host, create is_host: true
      #redirect to users/id page user_path(user)
    else
      #flash[:error] = errors.message.full_sentence
      #redirect to new_user_movie_viewing_party_path(@user, @movie.id)
    end
  end

  private

  def party_params
    params.permit(:duration, :party_date, :party_time, :movie_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end


  def make_host
    host = find_user
    host.update(is_host: true)
  end

  # def create__user_parties(party)
  #   params[:user_ids].each do |user_id|
  #     UserParty.create(user: find_user(user_id), party: party)
  #   end
  # end
end
