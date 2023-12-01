require "rails_helper"

RSpec.describe Movie, type: :model do
  
  describe "relationships" do
    it { should have_many(:parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:runtime) }

  end

  describe 'create a movie from api model method', :vcr do
    it 'will create a movie from an api' do
      @movie = Movie.create_from_api(808)
      expect(@movie.title).to eq("Shrek")
      expect(@movie.tmdb_id).to eq(808)
      expect(@movie.runtime).to eq(90)
    end
  end
end