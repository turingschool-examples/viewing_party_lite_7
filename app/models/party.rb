class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  
  validates_presence_of :duration, :date, :start_time, :movie_id

  def self.create_with_checks(params, host, movie)
    party = new({
      duration: params[:duration],
      date: params[:date],
      start_time: params[:start_time],
      movie_id: params[:movie_id]
    })

    if movie.runtime > party.duration
      return false, party
    end

    party.save
    [true, party]
  end
end
