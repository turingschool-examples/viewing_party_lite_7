require 'rails_helper'

RSpec.describe 'user story 9' do
  describe 'movie results page' do
    before :each do
      @user1 = User.create(name: 'Bob', email: 'bob@email.com')
      @user2 = User.create(name: 'Sally', email: 'sally@email.com')

      
      visit "/users/#{@user1.id}/movie"
    end
    
    it 'displays movie title' do
      json_response = File.read('spec/fixtures/top_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_KEY']}")
        .to_return(status: 200, body: json_response)
        # require 'pry'; binding.pry

      @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true)[:results].first)
      
      expect(current_path).to eq("/users/#{@user1.id}/movie")
      expect(page).to have_content(@movie_detail.title)
     
    end

    it 'displays vote average' do
      json_response = File.read('spec/fixtures/top_movies.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_KEY']}")
        .to_return(status: 200, body: json_response)

      @movie_detail = MovieDetail.new(JSON.parse(json_response, symbolize_names: true)[:results].first)

      expect(current_path).to eq("/users/#{@user1.id}/movie")
      expect(page).to have_content(@movie_detail.vote_average)
    end
  end
end