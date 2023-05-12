## This creates the party class for viewing parties
class Party < ApplicationRecord
  validates_numericality_of :duration
  validates_presence_of :date
  validates_presence_of :time
  
  has_many :user_parties
  has_many :users, through: :user_parties

  def guests
    users.joins(:user_parties).where("user_parties.is_host=false").distinct
  end

  def format_date
    date.to_fs(:long)
  end

  def format_time
    time.strftime("%-l:%M %P")
  end

  def host
    users.joins(:user_parties).where("user_parties.is_host=true").distinct.pluck(:name).first
  end
end
