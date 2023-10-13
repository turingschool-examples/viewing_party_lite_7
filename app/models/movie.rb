class Movie < ApplicationRecord
  serialize :genres, Array
  has_many :viewing_parties 
  has_many :users, through: :viewing_parties
end
