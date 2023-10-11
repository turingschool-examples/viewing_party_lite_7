class Movie < ApplicationRecord
  has_many :viewing_parties 
  has_many :users, through: :viewing_parties
end
