require 'rails_helper'

describe "Movie Details Page", :vcr, type: :feature do
  before do
    @user = create(:user)
    @movie = nil# Some sort of movie object Godfather id is 238
    visit user_movie_path(@user, 238)
  end
  
  it "has a button to return to the discover page" do
    save_and_open_page
    expect(page).to have_button("Discover Page").once

    click_button("Discover Page")

    expect(current_path).to eq(user_discover_path(@user))
  end

  it "has a button to create a viewing party" do
    expect(page).to have_button("create-viewing-party").once

    click_button("create-viewing-party")

    expect(current_path).to eq("/users/#{@user.id}/movies/#{@movie}/viewing-party/new")
  end

  it "shows basic information about the movie" do
    within("#movie-title") do
      expect(page).to have_content(@movie.title)
    end

    within("#movie-details") do
      expect(page).to have_content(@movie.vote_average)
      expect(page).to have_content(@movie.runtime) #test runtime method that displays the time in hours/minutes in movie PORO test
      expect(page).to have_content(@movie.genres) #test genre method that displays the time genres concatenated together
    end

    within("#movie-summary") do
      expect(page).to have_content(@movie.summary)
    end
  end

  it "lists the first 10 cast members" do
    within("#movie-cast") do
      expect(page).to have_css("#cast-member").at_least(1).times
      expect(page).to have_css("#cast-member").at_most(10).times
    end
  end

  it "shows the count of total reviews" do
    within("#movie-reviews-count") do
      expect(page).to have_content(@movie.reviews_count)
    end
  end

  it "shows information for every review" do
    within("#movie-reviews") do
      expect(page).to have_css("#movie-review", count: @movie.reviews_count)

      # If there is at least one review, test that the first review shows the review data
      if @movie.reviews_count > 0
        review1 = @movie.reviews.first
        within(".movie-review").first do
          within(".review-author") do
            expect(page).to have_content(review1.author)
          end

          expect(page).to have_content(review1.content)
        end

        # If there is more than one review, test that different review data appears
        if @movie.reviews_count > 1
          review2 = @movie.reviews.second
          within(".movie-review").second do
            within(".review-author") do
              expect(page).to have_content(review2.author)
            end

            expect(page).to have_content(review2.content)
          end
        end
      end
    end
  end
end