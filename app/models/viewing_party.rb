class ViewingParty < ApplicationRecord
  has_many :users_viewing_parties
  has_many :users, through: :users_viewing_parties
  validates :date, :start_time, :duration, :movie_id, presence: true

  def host
    host = UsersViewingParty.where(viewing_party_id: id,hosting?: true).first
    User.find(host.user_id).name
  end
end