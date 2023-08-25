class ViewingParty < ApplicationRecord
   validates_presence_of :date, :start_time, :duration

has_many :user_viewing_parties
has_many :users, through: :user_viewing_parties
end