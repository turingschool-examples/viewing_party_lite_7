# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def my_movies
    movies = []
    viewing_parties.uniq.each do |party|
      movies << MovieFacade.movie_details(party.movie_id)
      movies << MovieFacade.cast(party.movie_id)
      movies << MovieFacade.reviews(party.movie_id)
    end
    movies
  end
end
