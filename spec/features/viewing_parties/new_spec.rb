require "rails_helper"

RSpec.describe "New Viewing Party Page", type: :feature do
  describe "new viewing party form" do
    it "displays a from to create a new viewing party", :vcr do
      user1 = User.create!(user_name:"Callie", email:"Cal@email.com")
      user2 = User.create!(user_name:"Steve", email:"Steve@email.com")
      user3 = User.create!(user_name:"Joe", email:"Joe@email.com")
      user4 = User.create!(user_name:"Jane", email:"Jane@email.com")

      movie = MovieFacade.new.find_movie(11)
      visit new_user_movie_viewing_party_path(user1, movie.id)
      expect(page).to have_content("Create a Movie Party for #{movie.title}")
      expect(page).to have_button("Discover Movies")

      expect(page).to have_content("Viewing Party Details")
      expect(page).to have_content("Movie Title: #{movie.title}")

      expect(page).to have_content('Duration of party')
      expect(page).to have_field(:duration)

      expect(page).to have_content('Day')
      expect(page).to have_field(:date)

      expect(page).to have_content('Start time')
      expect(page).to have_field(:start_time)
    end

    it "allows me to fill out form and create a new VP then get redirected back to my user dashboard", :vcr do
      user1 = User.create!(user_name:"Callie", email:"Cal@email.com")
      user2 = User.create!(user_name:"Steve", email:"Steve@email.com")
      user3 = User.create!(user_name:"Joe", email:"Joe@email.com")
      movie = MovieFacade.new.find_movie(11)
      visit new_user_movie_viewing_party_path(user1, movie.id)

      fill_in :duration, with: 120
      fill_in :date, with: '2023-11-11'
      fill_in :start_time, with: '12:00'
      check user2.email
      click_button 'Create Party'


    end
  end
end