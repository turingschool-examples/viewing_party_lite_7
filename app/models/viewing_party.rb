class ViewingParty < ApplicationRecord 
  has_many :viewing_party_users 
  has_many :users, through: :viewing_party_users

  validates_presence_of :duration_of_party, :start_time, :when, :movie_id

  def party_host 
    users.joins(:viewing_party_users).where('viewing_party_users.is_host = true').distinct.first
  end

  def users_invited 
    users.joins(:viewing_party_users).where('viewing_party_users.is_host = false').distinct
  end
end