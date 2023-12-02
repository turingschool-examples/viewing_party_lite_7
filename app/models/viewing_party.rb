class ViewingParty < ApplicationRecord
  validates :host, :movie, :duration, :date, :start_time, :guests, presence: true
end
