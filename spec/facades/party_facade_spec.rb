require 'rails_helper'

RSpec.describe PartyFacade do
  describe "party_facade" do
    before do
      @params = {"duration"=>"140", 
              "day(1i)"=>"2023",
              "day(2i)"=>"5",
              "day(3i)"=>"25",
              "time(1i)"=>"2023",
              "time(2i)"=>"5",
              "time(3i)"=>"12",
              "time(4i)"=>"20",
              "time(5i)"=>"30",
              "participants"=>["27", "29"],
              "commit"=>"Create Party",
              "controller"=>"parties",
              "action"=>"create",
              "user_id"=>"26",
               "movie_id"=>"550"}
      @facade = PartyFacade.new
    end

    it "#format_date" do
      expect(PartyFacade.format_date(@params)).to eq("May 25, 2023")
    end

    it "#format_time" do
      expect(PartyFacade.format_time(@params)).to eq("8:30 pm")
    end

    it "creates party" do
      expect(PartyFacade.create_party(@params)).to be_truthy
    end
  end
end