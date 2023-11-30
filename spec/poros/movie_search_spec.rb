require 'rails_helper'

RSpec.describe MovieSearch do
  it 'exists' do
    search_term = 'Star Wars'
    search = MovieSearch.new(search_term)
    expect(search).to be_a(MovieSearch)
    expect(search.search_term).to eq('Star Wars')
  end
end