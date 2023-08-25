require 'rails_helper'

RSpec.describe MovieCast do
  describe "initialize" do
    it "has attributes" do
      movie_cast_attributes = {
        id: 123,
        name: "Test",

      }
      movie_cast = MovieCast.new(movie_cast_attributes)

      expect(movie_cast.id).to eq(movie_cast_attributes[:id])
      expect(movie_cast.name).to eq(movie_cast_attributes[:name])
    end
  end
end