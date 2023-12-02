require 'rails_helper'

describe ServiceService do
  before :each do
    oppenheimer_test_data
  end

  context "get_url" do
    it "returns parsed json data" do
      url = "movie/popular"
      parsed_response = ServiceService.new.get_url(url)
      expect(parsed_response).to be_a(Hash)
      expect(parsed_response[:results]).to be_an(Array)
    end
  end

  context "#conn" do
    it "returns Faraday object" do
      service = ServiceService.new
      expect(service.conn).to be_a(Faraday::Connection)
    end
  end
end