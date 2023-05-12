require 'rails_helper'

RSpec.describe UserMovies do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @movie_data1 = UserMovies.new(type: 'search', data: 'test movie search results', user: @user1, query: 'star wars' )
    @movie_data2 = UserMovies.new(type: 'details', data: 'test movies details', user: @user2 )
  end

  describe '#initialize' do
    it 'exists' do
      expect(@movie_data1).to be_a(UserMovies)
      expect(@movie_data2).to be_a(UserMovies)
    end
  end

  describe '#type' do
    it 'has a type' do
      expect(@movie_data1.type).to eq('search')
      expect(@movie_data2.type).to eq('details')
    end
  end

  describe '#data' do
    it 'has data' do
      expect(@movie_data1.data).to eq('test movie search results')
      expect(@movie_data2.data).to eq('test movies details')
    end
  end

  describe '#user' do
    it 'has a user' do
      expect(@movie_data1.user).to eq(@user1)
      expect(@movie_data2.user).to eq(@user2)
    end
  end

  describe '#query' do
    context 'it is passed a query argument' do
      it 'has a query' do
        expect(@movie_data1.query).to eq('star wars')
      end
    end

    context 'it is not passed a query argument' do
      it 'defaults to nil' do
        expect(@movie_data2.query).to eq(nil)
      end
    end
  end

  describe '#user_name' do
    it 'returns the user name' do
      expect(@movie_data1.user_name).to eq(@user1.name)
      expect(@movie_data2.user_name).to eq(@user2.name)
    end
  end
end
