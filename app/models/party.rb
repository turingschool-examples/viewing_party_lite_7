class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def host_name
    users.where("user_parties.is_host = ?", true).pluck("users.name").first
  end
end