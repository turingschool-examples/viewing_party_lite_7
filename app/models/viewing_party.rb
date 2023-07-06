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
end
