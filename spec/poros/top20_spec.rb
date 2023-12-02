require 'rails_helper'

RSpec.describe Top20 do
  it 'exists' do
    movie = 'Top 20'
    test = Top20.new(movie)
    expect(test).to be_a(Top20)
  end
end
