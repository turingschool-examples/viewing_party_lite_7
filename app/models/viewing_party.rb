class ViewingParty < ApplicationRecord
  validates_presence_of :date,
                        :start_time,
                        :duration,
                        :movie_id,
                        :host_id

  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users
end
