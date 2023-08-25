require 'rails_helper'

RSpec.describe "Movie results page" do
  before do
    @user1 = User.create!(name: "Marvin", email: "Marvin@gmail.com")
  end

  describe "movie results page" do
    it "displays movies" do
      visit user_movies_path(@user1)
 
      expect(page).to have_link("Parasite")
      click_link "Parasite"

      expect(current_path).to eq("/users/#{@user1.id}/movies/496243")
    end
  end
end