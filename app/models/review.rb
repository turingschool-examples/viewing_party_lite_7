class Review < ApplicationRecord
    validates :author, presence: true
    validates :rating, presence: true
    validates :content, presence: true
    validates :movie_id, presence: true

    belongs_to :movie
end
