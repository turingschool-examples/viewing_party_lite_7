require 'rails_helper'

RSpec.describe "party new page", type: :feature do
  before :each do 
    @andra = User.create!(name: "Andra", email: "andra@turing.edu")
    @hady = User.create!(name: "Hady", email: "hady@turing.edu")
    VCR.use_cassette("top_rated_movies") do
      @results = MoviesFacade.top_rated_movies
    end
  end 
  describe "when visit the viewing party page" do 

    it "when you enter the viewing party, it lists the movie title, the voting average and the runtime" do
      VCR.use_cassette("party_new_spec", :allow_playback_repeats => true) do
        visit "/users/#{@hady.id}/movies/#{@results[0].movie_id}"

        click_link("Create Viewing Party")
          within("div#movie_title") do 
            expect(page).to have_content(/Movie Title(?=.+)/)
          end

          within("div#vote_average") do 
            expect(page).to have_content(/\d+\.\d+/)
          end
        
          within("div#runtime") do 
            expect(page).to have_content("Runtime")
            expect(page).to have_content("hours")
            expect(page).to have_content("minutes")
          end
        end 
      end 

    it "when you enter the genres, the summary description, and the first 10 cast members and their characters" do
      VCR.use_cassette("party_new_spec", :allow_playback_repeats => true) do
        visit "/users/#{@hady.id}/movies/#{@results[0].movie_id}"

        click_link("Create Viewing Party")
        within("div#genres") do 
          expect(page).to have_content(/Genres(?=.+)/)
        end

        within("div#description") do 
          expect(page).to have_content(/Summary Description(?=.+)/)
        end

        within("div#cast_members") do 
          expect(all('li').count).to eq(10)
          all('li').each do |li|
            expect(li.text).to include("as")
          end
        end

      end 
    end 


    it "when you enter, you see the count of reviews, and the information about each author" do
      VCR.use_cassette("party_new_spec", :allow_playback_repeats => true) do
        visit "/users/#{@hady.id}/movies/#{@results[0].movie_id}"

        click_link("Create Viewing Party")
        within("div#count_of_reviews") do 
          expect(page).to have_content("Number of Reviews")
          expect(page).to have_content(/\d+/)
        end

        within("div#author_information") do 
          expect(page).to have_content("Username")
          expect(page).to have_content("Avatar path")
          expect(page).to have_content("Rating")
        end
      end 
    end 
  end 
end 
