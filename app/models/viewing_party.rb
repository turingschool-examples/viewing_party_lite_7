class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :duration, :party_date, :start_time, :movie_id

  def movie_title
    MoviedbService.new.movie(self.movie_id)[:original_title]
  end
end