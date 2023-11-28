class Movie < ApplicationRecord
  has_many :viewing_parties

  validates :title, :vote_average, :runtime, :genre, :description, :cast_members, :review_count, :review_info, 
            presence: true
end
