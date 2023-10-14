# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#invited_friends' do
    let(:host) { User.create!(name: 'Weston', email: 'email.com') }
    let(:guest) { User.create!(name: 'Guest', email: 'guest.com') }
    let(:guest2) { User.create!(name: 'Guest2', email: 'guest2.com') }
    let(:movie) { Movie.create!(id: 100, title: 'Movie Title') }
    let!(:host_party) do
      ViewingParty.create!(movie_id: movie.id, user_id: host.id, date_time: '2021-08-01 01:00:00', is_host: true)
    end
    let!(:guest_party) do
      ViewingParty.create!(movie_id: movie.id, user_id: guest.id, date_time: '2021-08-01 01:00:00', is_host: false)
    end
    let!(:guest2_party) do
      ViewingParty.create!(movie_id: movie.id, user_id: guest2.id, date_time: '2021-08-01 01:00:00', is_host: false)
    end

    it 'returns a list of invited friends' do
      expect(controller.invited_friends(host_party)).to eq([guest, guest2])
    end
  end
end
