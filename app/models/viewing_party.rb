# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  validates :host_id, :duration, :day, :time, :movie_id, presence: true

  belongs_to :movie
  has_many :party_users

  def user_status(id)
    if id == host_id
      return "Hosting"
    else
      return "Invited"
    end
  end

  def time_formatted
    time.strftime("%H:%M")
  end
end
