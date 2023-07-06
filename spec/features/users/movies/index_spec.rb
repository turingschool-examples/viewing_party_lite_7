require 'rails_helper'

# I should be taken to the movies results page (users/:user_id/movies) where I see:   
#   Title (As a Link to the Movie Details page)
#   Vote Average of the movie
#   Details: There should only be a maximum of 20 results. The above details should be listed for each movie.
# I should also see a button to return to the Discover Page.

RSpec.describe "User's Movies page" do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
    visit user_movies_path(@user1)
  end

  it 'displays the title of the movie as a link to the movie details page' do

  end

  it 'displays the vote average of the movie' do

  end

  it 'has a button to return to the Discover Movies page' do
    
  end
end