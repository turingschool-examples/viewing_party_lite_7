class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates :party_duration, :start_time, :movie_title, :movie_id, presence: true

  def add_attendees(attendees)
    # goes through the params[:user_ids] (which is everyone who is checked off),
    # find the user related to that user_id, and add them to the VP.users
    return if attendees.nil?

    attendees.each do |id|
      users << User.find_by(id:)
    end
  end
end
