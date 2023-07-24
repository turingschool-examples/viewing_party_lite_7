require "rails_helper"

RSpec.describe "New Viewing Party Page", type: :feature do
  describe "new viewing party form" do
    it "displays a from to create a new viewing party", :vcr do
      user1 = User.create!(user_name:"Callie", email:"Cal@email.com", password: 'password123', password_confirmation: 'password123')
      user2 = User.create!(user_name:"Steve", email:"Steve5@email.com", password: 'password12', password_confirmation: 'password12')
      user3 = User.create!(user_name:"Joe", email:"Joe@email.com", password: 'password23', password_confirmation: 'password23')
      user4 = User.create!(user_name:"Jane", email:"Jane@email.com", password: 'password13', password_confirmation: 'password13')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      movie = MovieFacade.new.find_movie(11)
      visit new_movie_viewing_party_path(movie.id)
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
      user1 = User.create!(user_name:"Callie", email:"Cal@email.com", password: 'password123', password_confirmation: 'password123')
      user2 = User.create!(user_name:"Steve", email:"Steve6@email.com", password: 'password12', password_confirmation: 'password12')
      user3 = User.create!(user_name:"Joe", email:"Joe@email.com", password: 'password23', password_confirmation: 'password23')
      movie = MovieFacade.new.find_movie(11)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)


      visit new_movie_viewing_party_path(movie.id)

      expect(find_field(:duration).value.to_i).to eq(movie.runtime)
      expect(find_field(:host).value).to eq(user1.email)

      fill_in :duration, with: 120
      fill_in :date, with: '2023-11-11'
      fill_in :start_time, with: '12:00'
      check user2.email
      click_button 'Create Party'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(movie.title)
      expect(page).to have_content("#{user2.user_name}")
    end

    it "displays flash message to fill out all fields", :vcr do
      user1 = User.create!(user_name:"Callie", email:"Cal@email.com", password: 'password123', password_confirmation: 'password123')
      user2 = User.create!(user_name:"Steve", email:"Steve7@email.com", password: 'password12', password_confirmation: 'password12')
      user3 = User.create!(user_name:"Joe", email:"Joe@email.com", password: 'password23', password_confirmation: 'password23')
      movie = MovieFacade.new.find_movie(11)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit new_movie_viewing_party_path(movie.id)

      fill_in :duration, with: 120
      fill_in :start_time, with: '12:00'
      check user2.email
      click_button 'Create Party'

      expect(current_path).to eq(new_movie_viewing_party_path(movie.id))
      expect(page).to have_content("Please fill in all fields")
    end
  end
end