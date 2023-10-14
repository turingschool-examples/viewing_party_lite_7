class ViewingParty < ApplicationRecord 
  has_many :party_guests
  has_many :users, through: :party_guests

  validates_presence_of :party_date, :start_time, :duration, :movie_id

  # def host
  #   users.joins(:party_guests)
  #     .where(party_guests: {host: true})
  #     .name
  # end
end