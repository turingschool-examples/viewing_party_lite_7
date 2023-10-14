class User < ApplicationRecord 
    has_many :party_guests
    has_many :viewing_parties, through: :party_guests
    
    validates_presence_of :name, presence: true
    validates_presence_of :email, presence: true


    def invited_viewing_parties
        self.viewing_parties
    end
end