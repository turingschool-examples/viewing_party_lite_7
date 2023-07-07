require "rails_helper"

RSpec.describe Movie do
  describe "initialize" do
    it "exists and has attributes" do
      data = {  id: 11,
                title: "Star Wars",
                poster_path: "/gq5Wi7i4SF3lo4HHkJasDV95xI9.jpg",
                overview: "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
                vote_average: 8.203 }

      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(11)
      expect(movie.title).to eq("Star Wars")
      expect(movie.summary).to eq("Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.")
      expect(movie.vote_average).to eq(8.203)
    end
  end
end