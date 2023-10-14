class ViewingParty < ApplicationRecord 
  has_many :party_guests
  has_many :users, through: :party_guests

  validates_presence_of :party_date, :start_time, :duration, :movie_id

  def host_name
    host_guest = party_guests.find_by(host: true)
    host_guest&.user&.name
  end

  def invited_guests
    users.where(party_guests: { host: false })
  end

end