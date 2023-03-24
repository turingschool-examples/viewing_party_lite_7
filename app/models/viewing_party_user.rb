class ViewingPartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates_inclusion_of :host, in: [true, false]

  def host_user
    user.viewing_parties.where("host = true")
    user.name
  end
end