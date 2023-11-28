# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  validates :host_id
  validates :duration
  validates :day
  validates :time
  validates :movie_id

  has_one :movie
  has_many :party_users
end
