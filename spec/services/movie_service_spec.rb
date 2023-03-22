require 'rails_helper'

describe MovieService do

  # before :each do 
  #   @user = User.create!(name: 'User 1', email: 'email@email.com')

  #   VCR.use_cassette(:movies, serialize_with: :json) do
  #     visit "/user/#{@user.id}/discover"

  #     click_on "Top Movies"
  #   end
  # end

  context "class methods" do
    context "#top_movies" do
      it "returns top movie hash" do
        top_movies = MovieService.top_movies
        expect(top_movies).to be_a Hash
      end
    end
    context "#movies_by_title" do
      it "returns movie data" do
        search = MovieService.movies_search("Fight Club")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)
      end
    end
  end
end