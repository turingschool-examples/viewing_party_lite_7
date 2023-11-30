class Party < ApplicationRecord
  belongs_to :movie
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :duration, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  def host(user_id)
    party = UserParty.where("party_id = #{self.id} and user_id = #{user_id}").first
    if party.creator
      "Hosting"
    else
      "Invited"
    end
  end

end