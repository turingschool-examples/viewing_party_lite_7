require "rails_helper"

RSpec.describe Movie do
  before(:each) do
    test_movie_reviews
    test_movie_review_info
    @reviews = Review.new(@movie_reviews_data)
  end

  it "exists and has attributes" do
    expect(@reviews).to be_a(Review)
    expect(@reviews.all_reviews).to be_an(Array)
    expect(@reviews.all_reviews[0]).to be_a(String)
    expect(@reviews.all_reviews[0]).to eq("talisencrw's review: This unique take on the heist-film-gone-wrong was excellent--stylish and intelligently made, yet very funny and inexpensive. Tarantino's accolades from giving American cinema the resuscitation it needed mirrors what has happened, at least since the 70's, with Martin Scorsese's 'Mean Streets', both in terms of entertaining violence and usage of music in the scoring of films. I greatly thank Harvey Keitel for taking a chance on Tarantino back then--It paid off in spades.")
    expect(@reviews.review_count).to be_an(Integer)
    expect(@reviews.review_count).to eq(2)
  end

  it "#get_review_info(review_details)" do
    expect(@reviews.get_review_info(@movie_review_info_data)).to be_an(Array)
    expect(@reviews.get_review_info(@movie_review_info_data)[0]).to be_a(String)
    expect(@reviews.get_review_info(@movie_review_info_data)[0]).to eq("talisencrw's review: This unique take on the heist-film-gone-wrong was excellent--stylish and intelligently made, yet very funny and inexpensive. Tarantino's accolades from giving American cinema the resuscitation it needed mirrors what has happened, at least since the 70's, with Martin Scorsese's 'Mean Streets', both in terms of entertaining violence and usage of music in the scoring of films. I greatly thank Harvey Keitel for taking a chance on Tarantino back then--It paid off in spades.")
  end
end
