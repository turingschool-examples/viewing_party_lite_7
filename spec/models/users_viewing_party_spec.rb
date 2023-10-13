# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersViewingParty, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:viewing_party) }

  describe 'instance methods' do
    it '#name' do
      user = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
      user2 = User.create!(name: 'Jane Doe', email: 'jdoe@aol.com')
      viewing_party = ViewingParty.create!(movie_id: 2, movie_title: 'The Shining', movie_image: 'jpeg', duration: 90,
                                           date: '13/10/2023', start_time: '17:15:00')
      uvp1 = UsersViewingParty.create!(user_id: user.id, viewing_party_id: viewing_party.id, hosting?: true)
      uvp2 = UsersViewingParty.create!(user_id: user2.id, viewing_party_id: viewing_party.id)

      expect(uvp1.name).to eq('John Smith')
      expect(uvp2.name).to eq('Jane Doe')
    end
  end
end
