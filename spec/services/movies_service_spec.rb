require 'rails_helper'

RSpec.describe MoviesService do
  describe "#movie_images" do
    it "returns movie image information" do
      json_response = File.read("spec/fixtures/movie_images.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393/images?api_key=#{Rails.application.credentials.tmdb[:key]}").
         to_return(status: 200, body: json_response)

      images = MoviesService.new.movie_images(926393)
      expect(images).to be_a Hash
      expect(images[:posters]).to be_an Array

      poster = images[:posters].first

      expect(poster).to have_key :aspect_ratio
      expect(poster[:aspect_ratio]).to be_a Float
      
      expect(poster).to have_key :file_path
      expect(poster[:file_path]).to be_a String
    end
  end

  describe "#movie_details" do
    it "returns movie detail information" do
      json_response = File.read("spec/fixtures/movie_details.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393?api_key=#{Rails.application.credentials.tmdb[:key]}").
         to_return(status: 200, body: json_response)

      details = MoviesService.new.movie_details(926393)
      
      expect(details).to be_a Hash
      expect(details[:title]).to be_a String
    end
  end
end