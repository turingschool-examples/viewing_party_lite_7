class Users::Discover::Results::PartiesController < ApplicationController
  def new
    
  end

  def create
    @party = Party.new(party_params)

    if @party.save
      redirect_to 
    else
      flash[:alert] = ''
      redirect_to 
    end
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id)
  end
end
