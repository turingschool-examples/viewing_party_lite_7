require 'rails_helper'

RSpec.describe MoviedbService do
  describe "class methods" do 
    context "::fetch_api" do
      xit "returns json object" do
        expect(MoviedbService.fetch_api()).to be_a(JSON)
      end
    end
  end
end