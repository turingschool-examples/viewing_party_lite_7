class User < ApplicationRecord
  validates_presence_of :name, :email
  validates :email, uniqueness: { case_sensitive: false }
  has_many :party_guests
  has_many :viewing_parties, through: :party_guests

  def hosted_parties
    viewing_parties.joins(:party_guests).where('party_guests.user_id = ? AND party_guests.host = ?', id, true).distinct
  end

  def invited_parties
    viewing_parties.joins(:party_guests).where('party_guests.user_id = ? AND party_guests.host = ?', id,
                                               false).distinct
  end
end
