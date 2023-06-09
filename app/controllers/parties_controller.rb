class PartiesController < ApplicationController
  # before_action :require_login

  def new
    if current_user.nil?
      flash[:error] = "You must be logged in to view this page!"
      redirect_to user_movies_path(params[:user_id], params[:movie_id])
    else
      @user = current_user
      @movie_facade = MovieFacade.new(params[:movie_id])
      @users = User.all
    end
  end

  def create
    @user = current_user
    party = Party.create(party_params)
  
    if party.save
      UserParty.create(user_id: @user.id, party_id: party.id)

      params[:guests].each do |guest_id|
        UserParty.create(user_id: guest_id, party_id: party.id)
      end

      flash[:success] = "Viewing party created successfully!"
      redirect_to user_path(@user)
    else
      @movie_facade = MovieFacade.new(params[:movie_id])
      flash.now[:error] = "Error creating the viewing party: #{party.errors.full_messages.join(', ')}"
      render :new
    end
  end
  

  private

  def party_params
    params[:host_id] = params[:user_id]
    params.permit(:movie_id, :duration, :day, :time, :host_id)
  end

  # def require_login
  #   if !session[:user_id]
  #     flash[:error] = "You must be logged in to view this page!"
  #     redirect_to user_movie_path(params[:user_id], params[:movie_id])
  #   end
  # end
end