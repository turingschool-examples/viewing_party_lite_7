class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def pretty_day
    day.strftime("%B %d, %Y")
  end

  def long_hand_date
    start_time.to_fs(:long_ordinal)
  end

  def duration_in_hours_and_minutes
    "#{duration/60}h #{duration % 60}min"
  end
end