class Party < ApplicationRecord
  validates_presence_of :start_time, :party_date, :duration_of_party
  has_many :party_users
  has_many :users, through: :party_users

  def get_host_name
    Party.joins(:users)
         .select('users.name')
         .where('party_users.party_id = ? AND party_users.is_host = true', id)
         .first.name
  end

  def get_guest_names
    Party.joins(:users)
         .select('users.name')
         .where('party_users.party_id = ? AND party_users.is_host = false', id)
         .pluck(:name)
  end
end
