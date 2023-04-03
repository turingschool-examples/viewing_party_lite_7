require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    it { should validate_presence_of :duration_minutes }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :date }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :host_id }
  end

  describe "relationships" do
    it { should have_many :party_users }
    it { should have_many(:users).through(:party_users) }
  end

  describe "instance variables" do
    before :each do
      # STUBS
      movie_response = File.read("spec/fixtures/moviedb/space_odyssey.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: movie_response, headers: {})
        
      cast_response = File.read("spec/fixtures/moviedb/space_cast.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/credits?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: cast_response, headers: {})

      reviews_response = File.read("spec/fixtures/moviedb/space_reviews.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/reviews?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: reviews_response, headers: {})

      # @movie_details = Movie.new(JSON.parse(json_response, symbolize_names: true))

      # USERS
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com", password: "IamCaptain!")
      @riker = User.create!(name: "William Riker", email: "number2@uss-enterprise.com", password: "IamNumber2")
      @data = User.create!(name: "Data", email: "data@uss-enterprise.com", password: "IamData?")
      
      # PARTY
      @party1 = Party.create!(duration_minutes: 143, start_time: "08:00", date: Date.parse("2023-01-01"), movie_id: 62, host_id: @picard.id)
      @party2 = Party.create!(duration_minutes: 90, start_time: "10:30", date: Date.parse("2023-02-02"), movie_id: 238, host_id: @riker.id)

      PartyUser.create!(party_id: @party1.id, user_id: @picard.id, host_id: @party1.host_id)
      PartyUser.create!(party_id: @party1.id, user_id: @data.id, host_id: @party1.host_id)

      PartyUser.create!(party_id: @party2.id, user_id: @picard.id, host_id: @party2.host_id)
      PartyUser.create!(party_id: @party2.id, user_id: @riker.id, host_id: @party2.host_id)
      PartyUser.create!(party_id: @party2.id, user_id: @data.id, host_id: @party2.host_id)
    end

    it "#get_all_info" do
      result = { party_id: @party1.id,
        movie_id: 62,
        image: 'https://image.tmdb.org/t/p/w154/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg',
        title: "2001: A Space Odyssey", 
        duration_minutes: 143,
        date: Date.parse("2023-01-01"),
        start_time: Time.parse("2000-01-01 08:00:00.000000000 +0000"),
        host: @picard.name,
        attendees: [@picard, @data] }

      expect(@party1.get_all_info).to match(result)
    end
  end
end