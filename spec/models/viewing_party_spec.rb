# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  it { should have_many(:users_viewing_parties) }
  it { should have_many(:users).through(:users_viewing_parties) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:movie_id) }

  describe 'instance methods' do
    before :each do
      @user = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
      @user2 = User.create!(name: 'Jane Doe', email: 'jdoe@aol.com')
      @viewing_party = ViewingParty.create!(movie_id: 2, movie_title: 'The Shining', movie_image: 'jpeg', duration: 90,
                                            date: '13/10/2023', start_time: '17:15:00')
      @uvp1 = UsersViewingParty.create!(user_id: @user.id, viewing_party_id: @viewing_party.id, hosting?: true)
      @uvp2 = UsersViewingParty.create!(user_id: @user2.id, viewing_party_id: @viewing_party.id)
    end

    it '#host' do
      expect(@viewing_party.host).to eq('John Smith')
    end

    it '#guests' do
      expect(@viewing_party.guests).to eq([@uvp2])
    end

    it '#start' do
      expect(@viewing_party.start).to eq('Friday, October 13, 2023 05:15 pm')
    end

    it '#image_url', :vcr do
      expect(@viewing_party.image_url).to eq('http://image.tmdb.org/t/p/w300jpeg')
    end
  end
end
