# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :users_viewing_parties
  has_many :users, through: :users_viewing_parties
  validates :date, :start_time, :duration, :movie_id, presence: true

  def host
    host = UsersViewingParty.where(viewing_party_id: id, hosting?: true).first
    User.find(host.user_id).name
  end

  def guests
    users_viewing_parties.select do |uvp|
      uvp.hosting? == false
    end
  end

  def start
    "#{date.strftime('%A, %B %d, %Y')} #{start_time.strftime('%I:%M %P')}"
  end

  def image_url
    image = MovieFacade.new('3/configuration')
    display = image.image

    "#{display[:base_url]}#{display[:backdrop_sizes][0]}#{movie_image}"
  end
end
