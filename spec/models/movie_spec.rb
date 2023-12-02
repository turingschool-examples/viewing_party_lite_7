require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'class methods' do
    describe '#converts_runtime_to_hours_and_minutes' do
      it 'converts the runtime to hours and minutes' do
        @movie_1 = Movie.new(runtime: 120)
        expected_1 = '2 hours and 0 minutes'

        @movie_2 = Movie.new(runtime: 77)
        expected_2 = '1 hours and 17 minutes'

        @movie_3 = Movie.new(runtime: 17)
        expected_3 = '0 hours and 17 minutes'

        expect(@movie_1.convert_runtime_to_hours_and_minutes).to eq(expected_1)
        expect(@movie_2.convert_runtime_to_hours_and_minutes).to eq(expected_2)
        expect(@movie_3.convert_runtime_to_hours_and_minutes).to eq(expected_3)
      end
    end
  end
end
