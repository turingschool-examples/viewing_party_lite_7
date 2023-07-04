# Party model that represents a party that a user can host or attend
class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  validates_presence_of :date,
                        :start_time,
                        :duration,
                        :movie_id,
                        :host_id
end
