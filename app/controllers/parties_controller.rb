class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
  end

	def new
		@party = Party.new
		@movie = movie_params
		@users = User.all
		@movie_id = params[:movie_id]
	end

	def create
		user = User.find(params[:user_id])
		party = Party.new(party_params)
		UserParty.create(user: user, party: party, host: user)
		params[:party][:users].each do |user_id|
			next if user_id.empty?
			UserParty.create(user_id: user_id.to_i, party: party, host: user)
		end
		party.save
		redirect_to user_path(user)
	end

  private

  def movie_params
    params.permit(:title, :runtime, :movie_id)
  end

	def party_params
		params.require(:party).permit(:duration, :date, :time, :movie_id)
	end
end


