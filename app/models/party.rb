class Party < ApplicationRecord
  validates_presence_of :movie_id, :host_id, :day, :time, :duration

  has_many :user_parties
  has_many :users, through: :user_parties
end
