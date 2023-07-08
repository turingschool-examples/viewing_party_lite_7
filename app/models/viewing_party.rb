# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates :day, presence: true
  validates :start_time, presence: true

  def host_name
    users.where('user_viewing_parties.host = true').pluck(:name)
  end

  def invitee_names
    users.where('user_viewing_parties.host = false').pluck(:name)
  end

  def create_associations(host, invitees)
    UserViewingParty.create(viewing_party_id: self.id, user_id: host, host: true)
    invitees.each do |invitee|
      UserViewingParty.create(viewing_party_id: self.id, user_id: invitee, host: false)
    end
  end
end
