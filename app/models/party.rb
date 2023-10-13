class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates :movie_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  def get_host_name
    Party.joins(:users)
      .select("users.name")
      .where("party_users.party_id = ? AND party_users.is_host = true", self.id)
      .first.name
  end

  def get_guest_names
    Party.joins(:users)
      .select("users.name")
      .where("party_users.party_id = ? AND party_users.is_host = false", self.id)
      .pluck(:name)
  end
end