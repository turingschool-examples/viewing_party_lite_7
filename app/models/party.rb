class Party < ApplicationRecord
  validates_presence_of :duration_minutes,
                        :start_time,
                        :date,
                        :host_id
                        
  has_many :party_users
  has_many :users, through: :party_users
end