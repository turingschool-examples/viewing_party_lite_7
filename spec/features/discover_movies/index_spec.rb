require 'rails_helper'

RSpec.describe "Movie results page" do
  before do
    @user1 = User.create!(name: "Marvin", email: "Marvin@gmail.com")
  end

  describe "movie results page" do
    it "displays movies" do
      visit movies_user_path(@user1)


    end
  end
end