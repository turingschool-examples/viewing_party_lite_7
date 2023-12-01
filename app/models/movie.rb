# frozen_string_literal: true

class Movie < ApplicationRecord
  # should only be added to database after user starts a watchparty for that movie
  validates :title, :duration, presence: true

  has_many :viewing_parties
end
