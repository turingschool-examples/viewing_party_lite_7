class User < ApplicationRecord
  validates_presence_of :name, :email
  validates :email, uniqueness: { case_sensitive: false }
  has_many :party_guests
  has_many :viewing_parties, through: :party_guests

  def friends
    User.all.excluding(self)
  end
end
