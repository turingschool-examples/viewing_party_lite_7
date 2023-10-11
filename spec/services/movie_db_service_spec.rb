require "rails_helper"

RSpec.describe MovieDbService do
  let(:service) { MovieDbService.new }

  describe "movie_details" do
    before :each do
      stub_request(:get, "https://api.themoviedb.org/movie/100")
        .with(query: { api_key: Rails.application.credentials.the_movie_db[:key] })
        .to_return(body: File.read("./spec/fixtures/movie_details.json"))
    end

    it "returns movie details" do
      result = service.movie_details(100)
      expect(result).to be_a Hash
      expect(result[:title]).to eq("Lock, Stock and Two Smoking Barrels")
    end
  end
end