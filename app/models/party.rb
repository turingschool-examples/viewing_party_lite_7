class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  def host_name
    users.where("user_parties.is_host = ?", true).pluck("users.name").first
  end

  def invited_users 
    users.where(user_parties: { is_host: false })
  end
end
