class Movie < ApplicationRecord
  has_many :movie_cast_members
  has_many :movie_genres
  has_many :movie_reviews

  has_many :cast_members, through: :movie_cast_members
  has_many :genres, through: :movie_genres
  has_many :reviews, through: :movie_reviews
end