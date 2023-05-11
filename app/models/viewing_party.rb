# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :movie_id, presence: true
  validates :user_id, presence: true

  def self.find_hosted_parties(user)
    where(user_id: user.id)
  end

  def self.find_invited_parties(user)
    joins(:viewing_party_users)
    .where(viewing_party_users: {user_id: user.id})
  end
  
  def poster(id)
    movie = MovieService.new.get_specific_movie(id)
    movie[:poster_path]
  end

  def title(id)
    movie = MovieService.new.get_specific_movie(id)
    movie[:title]
  end

  def host
    user.name
  end

  def participants(user)
    users.where("viewing_party_id = #{self.id}")
    .where.not("viewing_party_users.user_id = #{user.id}")
    .pluck(:name).to_sentence
  end
end
