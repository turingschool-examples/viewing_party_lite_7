class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def pretty_day
    day.strftime("%B %e, %Y")
  end

  def pretty_time
    start_time.strftime("%l:%M %p")
  end
end