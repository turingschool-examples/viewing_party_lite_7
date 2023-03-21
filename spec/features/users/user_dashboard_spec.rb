require "rails_helper"

describe "when I visit the user dashboard page" do
  describe "i should see" do

    before :each do
      user = build(:user)
      visit "users/#{user.id}"

      require 'pry'; binding.pry
    end

    it "<user's name>'s Dashboard at the top of the page" do

    end

    it "a button to discover movies" do

    end

    it "a section that lists viewing parties" do

    end

  end
end