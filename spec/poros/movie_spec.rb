require 'rails_helper'

RSpec.describe Movie do
  let(:attributes) do
   movie_list = {
      movie: {
        id: 55,
        title: "Interstellar",
        vote_average: 9.0,
        runtime: 180,
        overview: "Man goes to space, chaos ensues",
        genres: [{id: 1, name: "Drama"}, {id: 2, name: "Science Fiction"}]
        },
      cast: [{:actor=>"You", :character=>"Dr. Pilot"}, {:actor=>"Me", :character=>"Dr. Engineer"}],
      reviews: [{:author=>"Spok", :review=> "It portrayed real life."}, {:author=>"Kirk", :review=> "If I had been captain..."}]
    }
  end
  let(:movie) { Movie.new(attributes) }
  
  it "exists & has attributes" do
    expect(movie).to be_a(Movie)
    expect(movie.movie_id).to eq(55)
    expect(movie.title).to eq("Interstellar")
    expect(movie.vote_avg).to eq(9.0)
    expect(movie.runtime).to eq(180)
    expect(movie.summary).to eq("Man goes to space, chaos ensues")
    expect(movie.genres).to eq([{id: 1, name: "Drama"}, {id: 2, name: "Science Fiction"}])
    expect(movie.cast).to eq([{:actor=>"You", :character=>"Dr. Pilot"}, {:actor=>"Me", :character=>"Dr. Engineer"}])
    expect(movie.reviews).to eq([{:author=>"Spok", :review=> "It portrayed real life."}, {:author=>"Kirk", :review=> "If I had been captain..."}])
  end
  
  it "#review_count" do
    expect(movie.review_count).to eq(2)

    attributes[:reviews] << { :author=>"Scotty", :review=>"It needs more power!" }

    expect(movie.review_count).to eq(3)
  end

  # it "#list_genres" do
  #   expect(movie.list_genres).to eq(["Drama", "Science Fiction"])
  # end
end