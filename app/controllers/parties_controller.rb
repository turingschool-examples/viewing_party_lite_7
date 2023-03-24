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
	end

	def create
		user = User.find(params[:user_id])
		party = Party.new(party_params)
		UserParty.create(user: user, party: party, host: user)
		params[:party][:users].each do |user_id|
			next if user_id.empty? || user_id == user.id.to_s
			UserParty.create(user_id: user_id.to_i, party: party, host: false)
		end
		party.save
		redirect_to user_path(user)
	end

  private

  def movie_params
    params.permit(:title, :runtime, :movie_id, :image_path)
  end

	def party_params
		params.require(:party).permit(:duration, :date, :time, :title, :movie_id, :image_path)
	end
end


