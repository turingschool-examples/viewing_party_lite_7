## Creates User class
class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, email: true

  has_many :user_parties
  has_many :parties, through: :user_parties

  def no_parties?
    parties.empty?
  end
end
