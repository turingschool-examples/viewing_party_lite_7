require 'rails_helper'

RSpec.describe Actor do
  describe "creates an object from the cast list" do
    before :each do
      lotr = File.read("spec/fixtures/get_cast.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/2493/credits?")
        .with(headers: {
        'X-API-KEY' => ENV['TMDB_KEY']
        })
        .to_return(status: 200, body: lotr, headers: {})
        
      pb = File.read("spec/fixtures/pb_actors.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/119")
        .with(headers: {
        'X-API-KEY' => ENV['TMDB_KEY']
        })
        .to_return(status: 200, body: pb, headers: {})
        
      @cast1  = Movie.new(JSON.parse(lotr, symbolize_names: true))
      @cast2 = Movie.new(JSON.parse(pb, symbolize_names: true))
    end
    
    it 'exists and has attributes' do
      id = 2493
    end
  end
end