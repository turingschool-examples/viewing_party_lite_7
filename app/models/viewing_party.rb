# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates :duration, presence: true
  validates :day, presence: true
  validates :view_time, presence: true
  validates :movie_id, presence: true

  def find_movie
    MovieFacade.new(movie_id).movie
  end

  def find_host(current_user)
    host_id = UserViewingParty.find_by('user_viewing_parties.host = true AND viewing_party_id = ?', id).user_id

    if current_user.id == host_id
      'Me'
    else
      User.find(host_id).name
    end
  end

  def party_guests
    users.joins(:user_viewing_parties)
         .select('users.*, user_viewing_parties.host')
         .where('user_viewing_parties.host = ?', false)
         .distinct
  end
end
