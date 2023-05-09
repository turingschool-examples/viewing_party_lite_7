class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates :date , presence: true
  validates :time , presence: true
  validates :duration , numericality: { only_integer: true }
end