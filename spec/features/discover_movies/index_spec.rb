require 'rails_helper'

RSpec.describe "Movie results page" do
  before do
    @user1 = User.create!(name: "Marvin", email: "Marvin@gmail.com")
  end

  describe "movie results page" do
    xit "displays movies" do
      visit movies_user_path(@user1)
      save_and_open_page
      require 'pry'; binding.pry
      expect(page).to have_content("#{@user1.name}'s Dashboard")

    end
  end
end