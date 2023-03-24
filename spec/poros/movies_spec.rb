require 'rails_helper'
RSpec.describe Movie do

  describe "Movie POROs" do 
    before :each do 
    @godfather = Movie.new({
      original_title: "Godfather", 
      vote_average: 3.45, 
      id: 849, 
      genres: ["Horror", "Romance"], 
      runtime: 181,
      overview: "A movie about love and horror", 
      cast: {"Al Pacino" => "Scarface", "Marlon Brando" => "The Old Man"}, 
      count_of_reviews: 2, 
      author_information: {}
    })
  end 

    it "is a Movie Object" do 
      expect(@godfather).to be_an_instance_of(Movie)
    end
    it "attributes" do 
      expect(@godfather.name).to eq("Godfather")
      expect(@godfather.name).to be_a(String)
      expect(@godfather.vote_average).to eq(3.45)
      expect(@godfather.vote_average).to be_a(Float)
      expect(@godfather.movie_id).to eq(849)
      expect(@godfather.movie_id).to be_a(Integer)
      expect(@godfather.genres).to eq(["Horror", "Romance"])
      expect(@godfather.genres).to be_a(Array)
      expect(@godfather.raw_runtime).to eq(181)
      expect(@godfather.raw_runtime).to be_a(Integer)
      expect(@godfather.runtime).to eq([3,1])
      expect(@godfather.runtime).to be_a(Array)
      expect(@godfather.description).to eq("A movie about love and horror")
      expect(@godfather.description).to be_a(String)
      expect(@godfather.cast_members).to eq({"Al Pacino" => "Scarface", "Marlon Brando" => "The Old Man"})
      expect(@godfather.cast_members).to be_a(Hash)
      expect(@godfather.count_of_reviews).to eq(2)
      expect(@godfather.count_of_reviews).to be_a(Integer)
      # expect(@godfather.author_information).to eq(2)
      # expect(@godfather.author_information).to be_a(Hash)

    end
  end
end 









  # it 'creates movies objects of the top rated movies' do 
  #   VCR.use_cassette("top_rated_movies") do
  #     expect(MoviesFacade.top_rated_movies.first).to be_a(Movies)
  #   end
  # end 

  # it 'creates movies objects of the results returned by the search' do 
  #   VCR.use_cassette("search_results_green") do
  #     expect(MoviesFacade.search_results("green").first).to be_a(Movies)
  #   end
  #   VCR.use_cassette("search_results_green") do
  #     expect(MoviesFacade.search_results("green").first.name.downcase).to include("green")
  #   end 
  # end

