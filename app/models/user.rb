class User < ApplicationRecord
  validates_presence_of :name, presence: true
  validates_presence_of :email, presence: true

  has_many :user_parties
  has_many :parties, through: :user_parties
  
  def hosted_parties
    parties.where(user_parties: {host_id: self.id})
  end

  def invited_parties
    parties.where(user_parties: {user_id: self.id}).where.not(user_parties: {host_id: self.id})
  end

  def get_hosted_movies(parties)
    result = []
    parties.each do |party|
      result << party.movie_id
    end
    result
  end

  def get_invited_movies(parties)
    #
  end
end