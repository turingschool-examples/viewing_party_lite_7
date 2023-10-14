class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  
  validates_presence_of :movie_id
  validates_presence_of :movie_title
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time

  def get_host_name
    host = user_parties.find do |up|
      up.is_host == true
    end
    User.find(host.user_id).name
  end
end