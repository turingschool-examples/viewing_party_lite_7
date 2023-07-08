class WatchPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all
    @movie = SearchFacade.new(params[:movie_id])
    @actor = ActorFacade.new(params[:movie_id])
    @review_facade = MovieReviewsFacade.new(params[:movie_id])
  end

  def create
    @user = User.find(params[:user_id])
    selected_user_ids = params[:selected_users] || []
    watch_party = @user.watch_parties.create!(watch_parties_params)
    if watch_party.save
      selected_user_ids.each do |user_id|
        User.movie_watch_parties.create(user_id: user_id, watch_party_id: @watch_party.id)
      end
      redirect_to "/users/#{@user.id}"
    end
  end

  private
  def watch_parties_params
    params.permit(:date, :duration, :start_time, :movie_title)
  end

  def movie_watch_party_params
    params.permit(:watch_party_id, :user_id, user_status: 0)
  end
end