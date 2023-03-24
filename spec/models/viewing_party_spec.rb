require "rails_helper"

describe ViewingParty, type: :model do
  describe "relationship" do
    it { should have_many :viewing_party_users }
    it { should have_many(:users).through(:viewing_party_users) }
  end
  
  describe "validations" do
    VCR.use_cassette("fight_club_2") do
      it { should validate_presence_of :duration }
    end
    VCR.use_cassette("fight_club_3") do
      it { should validate_presence_of :party_date }
    end
    VCR.use_cassette("fight_club_4") do
    it { should validate_presence_of :start_time }
    end
    VCR.use_cassette("fight_club_5") do
    it { should validate_presence_of :movie_id }
    end
  end

  describe "instance methods" do
    it "#viewing_party_movie" do
    VCR.use_cassette("fight_club_6") do
      @movie = MoviedbService.new.movie(550)
      @user = create(:user)
      @user2 = create(:user)
      @vp1 = ViewingParty.create!({duration: 500, party_date: Date.new(2011, 3, 1,), start_time: '21:00', movie_id: 550})
      ViewingPartyUser.create!(user_id: @user.id, viewing_party_id: @vp1.id, host: true)
      ViewingPartyUser.create!(user_id: @user2.id, viewing_party_id: @vp1.id, host: false)
      expect(@vp1.viewing_party_movie).to be_instance_of(Movie)
      expect(@vp1.viewing_party_movie.title).to eq("Fight Club")
    end
    end
  end
end