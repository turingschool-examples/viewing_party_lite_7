class CastMember < ApplicationRecord
    validates :name, presence: true
    validates :character, presence: true
    validates :movie_id, presence: true

    belongs_to :movie
end
