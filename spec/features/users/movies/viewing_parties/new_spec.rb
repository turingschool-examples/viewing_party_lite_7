require "rails_helper"

RSpec.describe "New Viewing Party Page", type: :feeature do
  before :each do
    @user_1 = User.create!(name: "Jamie", email: "34@gmail.com")
    @user_2 = User.create!(name: "Katie", email: "34997@gmail.com")
    @user_3 = User.create!(name: "George", email: "george@gmail.com")
  end

  feature "As a user" do
    feature "I should see the name of the movie title rendered above a form with fields" do
      scenario "I see duration of party, when, start time, a list of users and a button to create a party" do

        VCR.use_cassette("godfather_movie_details") do
        visit "/users/#{@user_1.id}/movies/238/viewing_parties/new"
        

          expect(page).to have_content("The Godfather Viewing Party")
          expect(page).to have_content("Duration")
          expect(page).to have_field("Duration", with: 175)
          expect(page).to have_content("When:")
          expect(page).to have_content("Start time")
          expect(page).to have_unchecked_field("#{@user_2.name}")
          expect(page).to have_unchecked_field("#{@user_3.name}")
          expect(page).to have_button("Create a Party")


          fill_in "Duration", with: 180
          fill_in "When:", with: 10/31/2023
          fill_in "Start time", with: "07:00:00"
          check "#{@user_2.name}"

          expect(page).to have_checked_field("#{@user_2.name}")
          expect(page).to have_unchecked_field("#{@user_3.name}")
        end
      end
    end
  end

  feature "As a user" do
    feature "when I click create a party" do
      feature "I should be redirected to my dashboard where I see the party listed" do
        scenario "all other users should also have party listed on dashboard" do

          VCR.use_cassette("godfather_movie_details") do
            visit "/users/#{@user_1.id}/movies/238/viewing_parties/new"

            fill_in "Duration", with: 180
            fill_in "When:", with: 10/31/2023
            fill_in "Start time", with: "07:00:00"
            check "#{@user_2.name}"

          end
          click_button "Create a Party"
          expect(current_path).to eq user_path("{@user_1.id}")
        end
      end
    end
  end

  feature "As a user" do
    feature "when I click create a party" do
      feature "If duration entered is less than runtime " do
        scenario "I am rerouted to the form and I see a flash message with an error" do
          VCR.use_cassette("godfather_movie_details") do
            visit "/users/#{@user_1.id}/movies/238/viewing_parties/new"

            fill_in "Duration", with: 50
            fill_in "When:", with: "2023-11-16"
            # page.find('#When:').set(Date.today)
            # fill_in "When:", with: DateTime.current.strftime("%Y%M%D")
            fill_in "Start time", with: "07:00:00"
            check "#{@user_2.name}"

          end
          click_button "Create a Party"
          expect(current_path).to eq("/users/#{@user_1.id}/movies/238/viewing_parties/new")
        end
      end
    end
  end
end

