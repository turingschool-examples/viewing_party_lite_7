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
    expect(@reviews.all_reviews[0].slice(0, 50)).to eq("talisencrw's review: This unique take on the heist")
    expect(@reviews.review_count).to be_an(Integer)
    expect(@reviews.review_count).to eq(2)
  end

  it "#get_review_info(review_details)" do
    expect(@reviews.get_review_info(@movie_review_info_data)).to be_an(Array)
    expect(@reviews.get_review_info(@movie_review_info_data)[0]).to be_a(String)
    expect(@reviews.get_review_info(@movie_review_info_data)[0].slice(0, 50)).to eq("talisencrw's review: This unique take on the heist")
  end
end
