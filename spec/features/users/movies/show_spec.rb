require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  before(:each) do
    @stan = create(:user)
    VCR.use_cassette(:movie_by_id_info, serialize_with: :json) do
      VCR.use_cassette(:cast_info, serialize_with: :json) do
        visit user_movie_path(@stan, 550) #Fight Club id is 550
      end
    end
  end

  describe "User Story 11 - Movie Show Page" do
    describe "As a user, when I visit a movie's detail page (/users/:user_id/movies/:movie_id)" do
      it "I see a button to return to the discover page" do
        # VCR.use_cassette(:movie_by_id_info, serialize_with: :json) do
        #   VCR.use_cassette(:cast_info, serialize_with: :json) do

            # visit user_movie_path(@stan, 550)
            click_button "Discover Page"
            
            expect(current_path).to eq(user_discover_index_path(@stan))
        #   end
        # end
      end

      it "I see a button to create a new viewing party" do
        # VCR.use_cassette(:movie_by_id_info, serialize_with: :json) do
        #   VCR.use_cassette(:cast_info, serialize_with: :json) do

        #     visit user_movie_path(@stan, 550)
            click_button "Create Viewing Party for Fight Club"

            expect(current_path).to eq("/users/#{@stan.id}/movies/550/viewing_party/new")
        #   end
        # end
      end

      it "shows the movie information" do
        expect(page).to have_content("Fight Club")
# save_and_open_page
        within "#movie_info" do
          expect(page).to have_content("Vote: 8.432")
          expect(page).to have_content("Runtime: 139min")
          expect(page).to have_content("Genre(s): Drama, Thriller, Comedy")
          expect(page).to have_content('A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.')
          expect(page).to have_content('Edward Norton - "The Narrator"')
          expect(page).to have_content('Brad Pitt - "Tyler Durden"')
          expect(page).to have_content('Helena Bonham Carter - "Marla Singer"')

        end
      end
    end
  end
end