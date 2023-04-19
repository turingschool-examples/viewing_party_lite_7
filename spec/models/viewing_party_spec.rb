# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  it { should have_many :viewing_party_users }
  it { should have_many(:users).through(:viewing_party_users) }

  it { should validate_numericality_of :duration }
  it { should validate_presence_of :duration }
  it { should validate_presence_of :movie_id }
  it { should validate_presence_of :date }
  it { should validate_presence_of :time }

  describe 'instance methods' do
    describe '#host' do
      it 'returns the name of the host' do
        user = User.create!(name: 'Bob', email: 'bob@bob.bob', password: 'bob')
        party = ViewingParty.create!(duration: 240, date: Date.tomorrow, time: '18:00', movie_id: 238, movie_title: 'The Godfather', movie_poster: 'poster')
        ViewingPartyUser.create!(user: user, viewing_party: party, host: true)
        expect(party.host).to eq(user.name)
      end
    end

    describe '#guests' do
    it 'returns all the guests' do
      user = User.create!(name: 'Bob', email: 'bob@bob.bob', password: 'bob')
      user2 = User.create!(name: 'Rob', email: 'blob@bob.bob', password: 'rob')
      user3 = User.create!(name: 'Cob', email: 'brob@bob.bob', password: 'cob')
      party = ViewingParty.create!(duration: 240, date: Date.tomorrow, time: '18:00', movie_id: 238, movie_title: 'The Godfather', movie_poster: 'poster')
      ViewingPartyUser.create!(user: user, viewing_party: party, host: true)
      ViewingPartyUser.create!(user: user2, viewing_party: party)
      ViewingPartyUser.create!(user: user3, viewing_party: party)

      expect(party.guests).to eq([user2, user3])
    end

  end
  end
end
