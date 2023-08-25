class ViewingParty < ApplicationRecord 
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  def find_host
    host = user_viewing_parties.where(host: true)[0] 
    if host
      host.user.name
    else
      nil
    end
  end
end