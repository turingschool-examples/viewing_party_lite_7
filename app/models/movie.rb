class Movie < ApplicationRecord
    validates :title, presence: true
    validates :vote_average, presence: true
    validates :runtime, presence: true
    validates :genres, presence: true
    validates :overview, presence: true
    validates :vote_count, presence: true

    has_many :reviews
    has_many :cast_members
end
