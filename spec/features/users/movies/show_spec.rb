require "rails_helper"
require "webmock"

RSpec.describe 'User Movie Show Page' do
    before :each do
        @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')

        # json_response_search = File.read('spec/fixtures/movie_search.json')
        #   stub_request(:get, 'https://api.themoviedb.org/3/search/movie?query=forrest+gump')
        #     .with(params: {'api_key' => Rails.application.credentials.tmdb[:key]})
        #     .to_return(status: 200, body: json_response_search)
        #   response_search = JSON.parse(json_response_search, symbolize_names: true)
        #   @movie_search = response_search[:results].first
    
        #visit user_movie_path(@user, @movie_search[:id])

        visit "/users/#{@user1.id}/movies/550"
    end

    describe " ", :vcr do
      it 'has a button to create a viewing party' do 
          expect(page).to have_button("Create New Viewing Party")
          
          click_button("Create New Viewing Party")

          expect(current_path).to eq(new_user_movie_viewing_party_path(@user, @movie_id))
      end
    end
end