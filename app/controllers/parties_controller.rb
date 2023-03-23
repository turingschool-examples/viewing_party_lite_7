class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
  end

	def new
		@party = Party.new
		@movie = MovieFacade.new.movie_details(params[:id])
	end

  private

  def party_params
    params.require(:party).permit(:name, :description, :location, :date, :time)
  end
end


