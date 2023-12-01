class Party < ApplicationRecord
  validates :movie_id, presence: true
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :name, presence: true
  
  has_many :user_parties
  has_many :users, through: :user_parties

  def get_host_name
    host_party = user_parties.includes(:user).find { |party| party.host == true }
    host_party.user.name if host_party.present?
  end
end