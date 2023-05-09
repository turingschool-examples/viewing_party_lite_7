require 'rails_helper'

RSpec.describe "User Dashboard", type: :feature do

  before(:each) do
    @user1 = User.create!(name: "Bob", email: "bob@bob.com")
    @user2 = User.create!(name: "John", email: "john@john.com")

    @viewing1 = ViewingParty.create!(duration: 1, date: Date.current, time: Time.current, movie_id: 1, movie_title: "Fellowship of the Ring")
    @viewing2 = ViewingParty.create!(duration: 2, date: 3.days.from_now, time: Time.current, movie_id: 2, movie_title: "Office Space")
    @viewing3 = ViewingParty.create!(duration: 3, date: 1.day.from_now, time: Time.current, movie_id: 3, movie_title: "The Dark Knight")

    visit(user_path(@user1))
  end

  describe "When I visit a Users dashboard page" do
    it "I see a header with the users name, a button to discover movies, and a list with all viewing parties" do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")

      within("#viewing-parties") do
        expect(page).to have_content(@viewing1.movie_title)
        expect(page).to have_content(@viewing2.movie_title)
        expect(page).to have_content(@viewing3.movie_title)
      end
    end
  end
end