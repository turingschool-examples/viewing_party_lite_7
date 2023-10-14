# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end

  describe 'guests method' do
    it 'returns all guests/users invited to a viewing party' do
      host = User.create!(name: 'Host', email: 'host@example.com')
      guest1 = User.create!(name: 'Guest 1', email: 'guest1@example.com')
      guest2 = User.create!(name: 'Guest 2', email: 'guest2@example.com')
      movie = Movie.create!(title: 'Inception')
      viewing_party = ViewingParty.create!(user_id: host.id, movie_id: movie.id, date_time: '2020-08-27', is_host: true)

      ViewingParty.create!(user_id: guest1.id, movie_id: movie.id, date_time: '2020-08-27', is_host: false)
      ViewingParty.create!(user_id: guest2.id, movie_id: movie.id, date_time: '2020-08-27', is_host: false)

      expect(viewing_party.guests).to eq([guest1, guest2])
    end
  end
end
