class ViewingParty < ApplicationRecord
  validates_presence_of :duration,
                        :date_time
  
  validates_numericality_of :duration   

  has_many :viewing_users
  has_many :users, through: :viewing_users
end
