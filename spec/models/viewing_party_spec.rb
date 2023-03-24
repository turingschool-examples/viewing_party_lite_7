require "rails_helper"

describe ViewingParty, type: :model do
  describe "relationship" do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end

  describe "validations" do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :party_date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :movie_id }
  end

  describe "instance methods" do
    it "#movie_title" do
    VCR.use_cassette("fight_club_2") do
      @movie = MoviedbService.new.movie(550)
      @user = create(:user)
      @user2 = create(:user)
      @vp1 = ViewingParty.create!({duration: 90, party_date: Date.new(2011, 3, 1,), start_time: '21:00', movie_id: 550})
      ViewingPartyUser.create!(user_id: @user.id, viewing_party_id: @vp1.id, host: true)
      ViewingPartyUser.create!(user_id: @user2.id, viewing_party_id: @vp1.id, host: false)
    end
    expect(@vp1.movie_title).to eq("Fight Club")
    end
  end
end