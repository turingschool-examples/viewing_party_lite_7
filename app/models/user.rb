class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :user_parties
  has_many :parties, through: :user_parties


  def list_parties
    movies = []  
    parties.uniq.each do |party|
      movies << MovieFacade.movie_details(party.movie_id)
    end
    movies 
  end
end