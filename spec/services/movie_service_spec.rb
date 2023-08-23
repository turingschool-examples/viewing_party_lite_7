require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    response = MovieService.top_rated_movies
    @movies = response[:results]

    expect(@movies).to be_an(Array)
    expect(@movies.count).to eq(20)
  end
end