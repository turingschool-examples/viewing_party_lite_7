require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should have_many(:viewing_party_users) }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_numericality_of(:duration).only_integer }
  end

  describe 'instance methods' do
    it '#movie_title' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/5?api_key=#{ENV['MOVIE_API_KEY']}")
        .to_return(status: 200, body: File.read("./spec/fixtures/four_rooms_info.json"))
    
      @viewing = ViewingParty.create!(duration: 1, date: Date.current, time: Time.current, movie_id: 5)
      
      expect(@viewing.movie_title).to eq("Four Rooms")
    end
  end
end