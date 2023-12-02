require 'rails_helper'

RSpec.describe MovieSearch do
  it 'exists' do
    search_term = { title: 'Star Wars', vote_average: 8.5 }
    search = MovieSearch.new(search_term)
    expect(search).to be_a(MovieSearch)
    expect(search.title).to eq('Star Wars')
    expect(search.vote_average).to eq(8.5)
  end
end
