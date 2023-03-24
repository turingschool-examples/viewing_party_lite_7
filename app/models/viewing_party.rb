class ViewingParty < ApplicationRecord 
  has_many :viewing_party_users 
  has_many :users, through: :viewing_party_users

  validates_presence_of :duration_of_party, :start_time, :when
end