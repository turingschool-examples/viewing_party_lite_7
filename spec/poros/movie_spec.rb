require './poros/movie'

RSpec.describe Movie do
  before(:all) do
    details = { 
      vote_average: 8.708,
      original_title: 'The Godfather',
      overview: 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.'
     }
    @movie1 = Movie.new(details)
  end

  it 'exists' do
    expect(@movie1).to be_an_instance_of(Movie)
  end

  it 'has attributes' do
    expect(@movie1.vote_avg).to eq(8.708)
    expect(@movie1.title).to eq('The Godfather')
    expect(@movie1.summary).to eq('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.')
  end
end
