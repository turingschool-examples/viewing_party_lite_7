require "rails_helper"

RSpec.describe MovieDbService do

  let(:service) { MovieDbService.new }

  describe "movie_details" do
    it "returns movie details", :vcr do
      result = service.movie_details(100)

      expect(result).to be_a Hash
      expect(result[:title]).to eq("Lock, Stock and Two Smoking Barrels")
    end
  end

  describe "movie_cast" do
    it "returns cast members from credits", :vcr do
      result = service.movie_cast(100)

      expect(result).to be_an Hash
      expect(result[:cast]).to be_an Array
      expect(result[:cast].first).to be_a Hash
      expect(result[:cast].first[:name]).to eq("Jason Flemyng")
      expect(result[:cast].first[:character]).to eq("Tom")
      expect(result[:cast].second[:name]).to eq("Dexter Fletcher")
      expect(result[:cast].second[:character]).to eq("Soap")
      expect(result[:cast].third[:name]).to eq("Nick Moran")
      expect(result[:cast].third[:character]).to eq("Eddy")
      expect(result[:cast].fourth[:name]).to eq("Jason Statham")
      expect(result[:cast].fourth[:character]).to eq("Bacon")
    end
  end

  describe "movie_reviews" do
    it "returns reviews from movie", :vcr do
      result = service.movie_reviews(100)

      expect(result).to be_a Hash
      expect(result[:results]).to be_an Array
      expect(result[:results].first).to be_a Hash
      expect(result[:results].first[:author]).to eq("BradFlix")
      expect(result[:results].first[:content]).to eq("I just plain love this movie!")
      expect(result[:results].first[:author_details][:rating]).to eq(nil)
      expect(result[:results].second[:author]).to eq("Andres Gomez")
      expect(result[:results].second[:content]).to eq("Far from being a good movie, with tons of flaws but already pointing to the pattern of the whole Ritchie's filmography.")
      expect(result[:results].second[:author_details][:rating]).to eq(3.0)
    end
  end

  describe "parse_response" do
    it "returns an empty hash when JSON parsing fails" do
      bad_response = instance_double("Faraday::Response", body: "invalid json")
      
      allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(bad_response)

      expect(service.movie_details(100)).to eq({})
      expect(service.movie_cast(100)).to eq({})
      expect(service.movie_reviews(100)).to eq({})
    end
  end
end