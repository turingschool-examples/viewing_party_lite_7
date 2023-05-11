# # frozen_string_literal: true

# require 'rails_helper'

# describe 'Movies discover page' do
#   before :each do
#     @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
#     @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
#   end

#   describe 'Page Display' do
#     it 'has application title' do
#       visit user_discover_index_path(@user1)
#       expect(page).to have_content('Viewing Party')

#       visit user_discover_index_path(@user2)
#       expect(page).to have_content('Viewing Party')
#     end

#     it 'has discover movies title' do
#       visit user_discover_index_path(@user1)
#       expect(page).to have_content('Discover Movies')

#       visit user_discover_index_path(@user2)
#       expect(page).to have_content('Discover Movies')
#     end

#     it 'has button to discover top rates movies' do
#       visit user_discover_index_path(@user1)
#       expect(page).to have_button('Top Rated Movies')

#       visit user_discover_index_path(@user2)
#       expect(page).to have_button('Top Rated Movies')
#     end

#     it 'has a text field to enter keywords that search by movie title and button' do
#       visit user_discover_index_path(@user1)

#       within '#search_button' do
#         expect(page).to have_css('input[type="text"]')
#         expect(page).to have_button('Search')
#       end

#       visit user_discover_index_path(@user2)

#       within '#search_button' do
#         expect(page).to have_css('input[type=text]')
#         expect(page).to have_button('Search')
#       end
#     end
#   end

#   describe 'Button Functionallity' do
#     describe 'Top Rated Movies Button' do
#       it 'redirects to movies result page', :vcr do
#         visit user_discover_index_path(@user1)

#         click_button('Top Rated Movies')
#         expect(current_path).to eq(user_movies_path(@user1))

#         visit user_discover_index_path(@user2)

#         click_button('Top Rated Movies')
#         expect(current_path).to eq(user_movies_path(@user2))
#       end

#       feature 'user can search for top 20 movies' do
#         scenario 'user clicks Top 20 button and API call is made', :vcr do
#           visit user_discover_index_path(@user1)

#           @movie1 = SearchFacade.new({ type: 'top_rated' }).movies.first
#           click_on 'Top Rated Movies'
#           expect(current_path).to eq(user_movies_path(@user1))
#           expect(page).to have_css('#movies', count: 20)
#           within("#movie-#{@movie1.id}") do
#             expect(page).to have_content(@movie1.title)
#             expect(page).to have_content(@movie1.title)
#           end
#         end
#       end
#     end

#     describe 'Search Button' do
#       it 'redirects to movies result page', :vcr do
#         visit user_discover_index_path(@user1)

#         fill_in 'title', with: 'Interstellar'
#         click_button('Search')
#         expect(current_path).to eq(user_movies_path(@user1))

#         visit user_discover_index_path(@user2)

#         fill_in 'title', with: 'Kill'
#         click_button('Search')
#         expect(current_path).to eq(user_movies_path(@user2))
#       end
#     end
     

#     feature 'user can search for movies by title' do
#       scenario 'user inputs movie title and clicks button, API call is made', :vcr do
#         visit user_discover_index_path(@user1)

#         fill_in 'title', with: 'Kill'
#         click_on 'Search'
#         @movie1 = SearchFacade.new({ movie: 'Kill' }).movies.first
#         expect(current_path).to eq(user_movies_path(@user1))
#         expect(page).to have_css('#movies', count: 20)
#         within("#movie-#{@movie1.id}") do
#           expect(page).to have_content(@movie1.title)
#           expect(page).to have_content(@movie1.vote_average)
#         end
#       end
#     end
#   end
# end
