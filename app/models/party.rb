# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates :date, presence: true
  validates :time, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :movie_id, presence: true

  def movie_title
   movie = MovieFacade.get_movie(self.movie_id)
   movie.title
  end
end
