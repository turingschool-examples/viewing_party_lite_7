class Party < ApplicationRecord
  validates_presence_of :user,
                        :movie

  has_many :user_parties
  has_many :users, through: :user_parties
end