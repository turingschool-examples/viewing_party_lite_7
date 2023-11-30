class Party < ApplicationRecord
  belongs_to :movie
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :duration, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

end