class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def pretty_day
    day.strftime("%B %e, %Y")
  end

  def pretty_time
    start_time.strftime("%l:%M %p")
  end

  

  def pretty_time
    start_time.strftime("%I:%M %p")
  end

  def duration_in_hours_and_minutes
    "#{duration/60}h #{duration % 60}min"
  end

  def host
    User.where("#{self.id} = user_party.party_id and user_party.host = true")
  end
end