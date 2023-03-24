class Party < ApplicationRecord
  validates_presence_of :movie_id, :host_id, :day, :time, :duration

  has_many :user_parties
  has_many :users, through: :user_parties

  def host
    self.users.where(id: self.host_id).first
  end

  def guests
    self.users.where.not(id: self.host_id)
  end
end
