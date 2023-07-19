require "rails_helper"

RSpec.describe "Sad Path Visitor" do
  describe "as a visitor" do
    it "Errors if trying to visit dashboard while not logged in" do
      visit root_path

      
    end
  end
end