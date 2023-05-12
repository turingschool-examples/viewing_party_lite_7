class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true

  def viewing_party_movie_ids
    viewing_parties.pluck(:movie_id)
  end

  def user_type(movie_id)
    viewing_parties.find_by(movie_id:)
  end
end
