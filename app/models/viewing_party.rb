class ViewingParty < ApplicationRecord
    belongs_to :user
    has_many :viewing_party_users
    has_many :users, through: :viewing_party_users
    validates_presence_of :date
    validates_presence_of :movie_id
    validates_presence_of :user_id
    validates_presence_of :duration
    validates_presence_of :start_time
end
