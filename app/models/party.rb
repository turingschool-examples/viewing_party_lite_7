class Party < ApplicationRecord
  belongs_to :movie
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :duration, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true

  def host(user_id)
    party = UserParty.where("party_id = #{self.id} and user_id = #{user_id}").first
    if party.creator
      "Hosting"
    else
      "Invited"
    end
  end

  def image_api_call
    if movie.tmdb_id
      MovieService.image_api_call(movie.tmdb_id)
    end
  end

  def self.formatted_date(params)
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    "#{months[params["day(2i)"].to_i-1]} #{params["day(3i)"]}, #{params["day(1i)"]}"
  end

  def self.formatted_time(params)
    if params["time(4i)"].gsub('*0', '').to_i < 12
      if params["time(4i)"].gsub('*0', '').to_i == 0
        "12:#{params["time(5i)"]} am"
      else
        "#{params["time(4i)"].gsub('*0', '').to_i}:#{params["time(5i)"]} am"
      end
    else
      if params["time(4i)"].to_i == 12
        "12:#{params["time(5i)"]} pm"
      else
        "#{params["time(4i)"].to_i-12}:#{params["time(5i)"]} pm"
      end
    end
  end

end