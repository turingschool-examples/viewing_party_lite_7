class Movie < ApplicationRecord
  has_many :viewing_parties
  belongs_to :user
end