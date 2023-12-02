require 'rails_helper'

RSpec.describe Movie do
  before(:all) do
    movie1_details = {
      id: 238,
      vote_average: 8.200,
      original_title: 'The Godfather',
      runtime: 175,
      genres: 'animation',
      overview: 'When an unconfident young woman is cursed with an old body by a spiteful witch',
      name: 'Takuya Kimura',
      character: 'Howl',
      total_results: 5,
      author: 'randoms',
      content: 'good stuff'
    }
    @movie1 = Movie.new(movie1_details)

    movie2_details = {
      id: 240,
      vote_average: 8.900,
      original_title: 'The Godfather',
      runtime: 175,
      genres:[
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 80,
            "name": "Crime"
        }
      ],
      overview: 'When an unconfident young woman is cursed with an old body by a spiteful witch',
      name: 'Dude',
      character: 'Dudemeister',
      total_results: 10,
      author: 'randoms',
      content: 'good stuff'
    }
    @movie2 = Movie.new(movie2_details)
  end

  it 'exists' do
    expect(@movie1).to be_an_instance_of(Movie)
  end

  it 'has attributes' do
    expect(@movie1.movie_id).to eq(238)
    expect(@movie1.vote_avg).to eq(8.200)
    expect(@movie1.title).to eq('The Godfather')
    expect(@movie1.runtime).to eq(175)
    expect(@movie1.genre).to eq('animation')
    expect(@movie1.summary).to eq('When an unconfident young woman is cursed with an old body by a spiteful witch')
    expect(@movie1.cast_names).to eq('Takuya Kimura')
    expect(@movie1.cast_roles).to eq('Howl')
    expect(@movie1.review_count).to eq(5)
    expect(@movie1.review_author).to eq('randoms')
    expect(@movie1.review_details).to eq('good stuff')
  end

  describe '#genre_name' do
    it 'returns just a string if genre name is not an array' do
      expect(@movie1.genre_name).to eq('animation')
    end

    it 'returns an array of genres if not a string' do
      expect(@movie2.genre_name).to eq(['Drama', 'Crime'])
    end
  end

  describe '#runtime_hrs_and_mins' do
    it 'formats movie runtime' do
      expect(@movie1.runtime_hrs_and_mins).to eq('2h 55min')
    end
  end
end
