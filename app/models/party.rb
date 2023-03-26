class Party < ApplicationRecord
  validates_presence_of :duration_minutes, 
                       :start_time, 
                       :date,
                       :movie_id,
                       :host_id

  has_many :party_users
  has_many :users, through: :party_users

  # Doesn't work yet:  
  # def invitee_names
  #   require 'pry'; binding.pry
  #   party_users
  #   party
  #     .joins(:users)
  #     .select("users.*")
  #     .where("party_users.host_id != users.id")
  #     .pluck("users.name")
  # end

end