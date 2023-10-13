require "rails_helper"

RSpec.describe "user show page", type: :feature do
  before :each do
    @user_1 = User.create!(name: "Jamie", email: "34@gmail.com")
    @user_2 = User.create!(name: "Katie", email: "34997@gmail.com")
    @user_3 = User.create!(name: "George", email: "george@gmail.com")
    @viewing_party_1 = ViewingParty.create!(duration: 180, date: "2023-05-14", start_time: "07:00:00", movie_id: 238, host_user_id: @user_2.id)
    @viewing_party_2 = ViewingParty.create!(duration: 180, date: "2023-05-16", start_time: "07:00:00", movie_id: 155, host_user_id: @user_1.id)
    UserViewingParty.create!(user: @user_1, viewing_party: @viewing_party_1)
    UserViewingParty.create!(user: @user_3, viewing_party: @viewing_party_1)
    UserViewingParty.create!(user: @user_2, viewing_party: @viewing_party_2)
    UserViewingParty.create!(user: @user_3, viewing_party: @viewing_party_2)
    
    visit "/users/#{@user_1.id}"
  end

  feature "As a user" do
    feature "When I access my user show page" do
      scenario "I see the user's name, a button to discover movies and a list of viewing parties I am invited to, as well as a list of viewing parties I am hosting" do
        expect(page).to have_content("#{@user_1.name}'s Dashboard")
        expect(page).to have_content("User email: #{@user_1.email}")
        expect(page).to have_button("Discover Movies")
        within (".party_invitations") do
          expect(page).to have_content("Viewing Party Invitations")
        end

        within (".hosted_parties") do
          expect(page).to have_content("Viewing Parties I'm Hosting")
        end
      end

      feature "and I look at my viewing party invitations" do
        scenario "I see the movie image, the movie title (which links to that movies show page), the date and time of the party, who is hosting the event, and the list of users invited (with my name in bold)" do
          visit "/users/#{@user_1.id}"

          within (".party_invitations") do
            within (".the_godfather") do
              expect(page).to have_xpath("//img[@src='https://image.tmdb.org/t/p/w92/qJ2tW6WMUDux911r6m7haRef0WH.jpg']")
              expect(page).to have_link("The Godfather")
              expect(page).to have_content("When: #{@viewing_party_1.date}")
              expect(page).to have_content("Start Time: #{@viewing_party_1.start_time}")
              expect(page).to have_content("Host: #{@user_2.name}")
              expect(page).to have_content("Invitees: #{@user_1.name}, #{@user_3.name}")
              expect(page).to have_css('strong', text: "#{@user_1.name}", visible: true)
              click_link("The Godfather")
            end
          end
          expect(current_path).to eq("/users/#{@user_1.id}/movies/238")
        end
      end

      feature "and I look at the viewing parties I'm hosting" do
        scenario "I see the movie image, the movie title (which links to that movies show page), the date and time of the party, that I am hosting the event, and the list of users invited" do
          visit "/users/#{@user_1.id}"

          within (".hosted_parties") do
            within (".dark_knight") do
              expect(page).to have_xpath("//img[@src='https://image.tmdb.org/t/p/w92/3bhkrj58Vtu7enYsRolD1fZdja1.jpg']")
              expect(page).to have_link("The Dark Knight")
              expect(page).to have_content("When: #{@viewing_party_2.date}")
              expect(page).to have_content("Start Time: #{@viewing_party_2.start_time}")
              expect(page).to have_content("Host: I am hosting")
              expect(page).to have_content("Invitees: #{@user_2.name}, #{@user_3.name}")
              click_link("The Dark Knight")
            end
          end
          expect(current_path).to eq("/users/#{@user_1.id}/movies/155")
        end
      end
    end
  end
end
    