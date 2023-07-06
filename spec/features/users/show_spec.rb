require "rails_helper"

RSpec.describe "/users/:id" do
  describe "As a visitor" do
    describe "when I visit the users show page" do
      let!(:user_1) { create(:user) }
      let!(:user_2) { create(:user) }
      let!(:user_3) { create(:user) }

      let!(:movie_1) { create(:movie) }
      let!(:movie_2) { create(:movie) }
      let!(:movie_3) { create(:movie) }

      let!(:wapa_1) { create(:watch_party, movie_id: movie_1.id) }
      let!(:wapa_2) { create(:watch_party, movie_id: movie_2.id) }
      let!(:wapa_3) { create(:watch_party, movie_id: movie_3.id) }

      let!(:movie_watch_party_1) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_1.id) }
      let!(:movie_watch_party_2) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_2.id) }
      let!(:movie_watch_party_3) { create(:movie_watch_party, watch_party_id: wapa_1.id, user_id: user_3.id) }

      let!(:movie_watch_party_4) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_1.id) }
      let!(:movie_watch_party_5) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_2.id) }
      let!(:movie_watch_party_6) { create(:movie_watch_party, watch_party_id: wapa_2.id, user_id: user_3.id) }

      let!(:movie_watch_party_7) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_1.id) }
      let!(:movie_watch_party_8) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_2.id) }
      let!(:movie_watch_party_9) { create(:movie_watch_party, watch_party_id: wapa_3.id, user_id: user_3.id) }

      it "displays the user's name at the top of the page" do
        visit user_path(user_1)
        expect(page).to have_content("#{user_1.name}'s Dashboard")
        expect(page).to_not have_content("#{user_2.name}'s Dashboard")

        visit user_path(user_2)
        expect(page).to have_content("#{user_2.name}'s Dashboard")
        expect(page).to_not have_content("#{user_1.name}'s Dashboard")
      end

      it "displays a button to discover movies" do
        visit user_path(user_1)
        expect(page).to have_button("Discover Movies")
        click_button "Discover Movies"
        expect(current_path).to eq("/users/#{user_1.id}/discover")
      end

      it "has a section that lists viewing parties" do
        movie_watch_party_1.update(user_status: 0)
        movie_watch_party_2.update(user_status: 1) # makes user_2 the host of wapa_1

        movie_watch_party_4.update(user_status: 0)
        movie_watch_party_5.update(user_status: 1) # makes user_5 the host of wapa_2

        movie_watch_party_7.update(user_status: 1)

        visit user_path(user_1)

        within ".attending" do
          expect(page).to have_content("#{user_1.name}'s Watch Parties: Attending")

          expect(page).to have_content("Movie: #{movie_1.title}")
          expect(page).to have_content("Watch Date: #{wapa_1.date}")
          expect(page).to have_content("Start Time: #{wapa_1.start_time}")
          expect(page).to have_content("Attendees")

          expect(page).to have_content("Movie: #{movie_2.title}")
          expect(page).to have_content("Watch Date: #{wapa_2.date}")
          expect(page).to have_content("Start Time: #{wapa_2.start_time}")


          # within "##{wapa_1.id}" do
          #   expect(page).to have_content(user_1.name)
          #   expect(page).to have_content(user_2.name)
          #   expect(page).to have_content(user_3.name)
          # end
          # movie image
          # movie title needs link to movie show page
          # who is hosting
          # list of users invited, my name in bold
        end

        within ".hosting" do
          expect(page).to have_content("#{user_1.name}'s Watch Parties: Hosting")

          expect(page).to have_content("Movie: #{movie_3.title}")
          expect(page).to have_content("Watch Date: #{wapa_3.date}")
          expect(page).to have_content("Start Time: #{wapa_3.start_time}")
          # Movie Image
          # Movie Title, which links to the movie show page
          # That I am the host of the party
          # List of friends invited to the viewing party
        end
      end
    end
  end
end
