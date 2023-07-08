require "rails_helper"

RSpec.describe Movie do
  before(:each) do
    test_movie_cast
    test_movie_credits

    @credits = Credit.new(@movie_credits_data)
  end

  it "exists and has attributes" do
    expect(@credits).to be_a(Credit)
    expect(@credits.cast).to be_an(Array)
    expect(@credits.cast[0]).to be_an(Array)

    expect(@credits.cast[0].flatten[0]).to be_a(String)
    expect(@credits.cast[0].flatten[0]).to eq("Rahul Khanna")

    expect(@credits.cast[0].flatten[1]).to be_a(String)
    expect(@credits.cast[0].flatten[1]).to eq("Rahul Seth")
  end

  it "#find_all_credits(credit_details)" do
    expect(@credits.find_all_credits(@movie_cast_data)).to be_an(Array)
    expect(@credits.find_all_credits(@movie_cast_data)[0]).to be_an(Array)
    expect(@credits.find_all_credits(@movie_cast_data)[0][0]).to be_a(String)
    expect(@credits.find_all_credits(@movie_cast_data)[0][0]).to eq("Steve Buscemi")

    expect(@credits.find_all_credits(@movie_cast_data)[0][1]).to be_a(String)
    expect(@credits.find_all_credits(@movie_cast_data)[0][1]).to eq("Mr. Pink")
  end
end
