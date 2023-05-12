require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should have_many(:partygoers) }
    it { should have_many(:users).through(:partygoers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:movie_id) }
  end

  describe 'instance methods', :vcr do
    before(:each) do
      @user1 = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)
      MovieFacade.new(550).find_movie
      @party1 = create(:party, movie_id: 550)
      @party2 = create(:party, movie_id: 550)
      create(:partygoer, user: @user1, party: @party1, host: true)
      create(:partygoer, user: @user2, party: @party1)
      create(:partygoer, user: @user1, party: @party2)
      create(:partygoer, user: @user2, party: @party2, host: true)
      create(:partygoer, user: @user3, party: @party2)
    end
    describe '#attendees' do
      it 'can return a list of attendees without the host' do
        expect(@party1.attendees_names).to eq([@user2.user_name])
        expect(@party2.attendees_names).to eq([@user1.user_name, @user3.user_name])
      end
    end

    describe '#host_name' do
      it 'returns the host name' do
        expect(@party1.host_name).to eq(@user1.user_name)
        expect(@party2.host_name).to eq(@user2.user_name)
      end
    end

    describe '#movie_title' do
      it 'returns the movie title' do
        expect(@party1.movie_title).to eq('Fight Club')
      end
    end

    describe '#movie_image_src' do
      it 'returns the movie image src' do
        expect(@party1.movie_image_src).to eq('https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
      end
    end
  end
end
