# frozen_string_literal: true

class Movie < ApplicationRecord
  # should only be added to database after user starts a watchparty for that movie
  validates :title
  validates :duration
  validates :genre
  validates :vote
  validates :cast
  validates :reviews

  belongs_to :viewing_party
end
