require "rails_helper"

RSpec.describe ViewingParty, :vcr do
  describe "validations" do
    it { should belong_to :user }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :duration}
    it { should validate_numericality_of :duration } 
    it { should validate_presence_of :party_date } # validate date is on or after today?
    it { should validate_presence_of :start_time } # validate time is at or after now?
    it "validates duration has a minimum value of the movie runtime" do
      ally = User.create!(name: "Ally Jean", email: "allyjean@example.com")
      movie = MoviesService.new.find_movie(234)
      expect(ViewingParty.create(user: ally, movie_id: 234, duration: 77, party_date: Date.today, start_time: Time.now)).to_not be_valid
      expect(ViewingParty.create(user: ally, movie_id: 234, duration: 78, party_date: Date.today, start_time: Time.now)).to be_valid
    end
  end

  it "can report movie duration" do
    ally = User.create!(name: "Ally Jean", email: "allyjean@example.com")
    movie = MoviesService.new.find_movie(234)
    party = ViewingParty.create!(user: ally, movie_id: 234, duration: 78, party_date: Date.today, start_time: Time.now)
    expect(party.movie_duration).to eq(78)
  end
end