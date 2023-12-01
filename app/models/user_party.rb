class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party
  
  # validates :duration, presence: true
  # validates :start_time, presence: true
  # validates :date, presence: true
  # validates :, presence: true
end