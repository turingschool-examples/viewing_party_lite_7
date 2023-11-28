class Party < ApplicationRecord
  validates_presence_of :start_time, :party_date, :duration_of_party
  has_many :party_users
  has_many :users, through: :party_users
end
