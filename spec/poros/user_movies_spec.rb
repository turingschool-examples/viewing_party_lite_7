require 'rails_helper'

RSpec.describe UserMovies do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user_movies1 = UserMovies.new(type: 'search', movies: Array.new(5, create(:movie)), user: @user1,
                                   query: 'star wars')
    @user_movies2 = UserMovies.new(type: 'details', movies: Array.new(5, create(:movie)), user: @user2)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@user_movies1).to be_a(UserMovies)
      expect(@user_movies2).to be_a(UserMovies)
    end
  end

  describe '#type' do
    it 'has a type' do
      expect(@user_movies1.type).to eq('search')
      expect(@user_movies2.type).to eq('details')
    end
  end

  describe '#movies' do
    it 'has movies' do
      expect(@user_movies1.movies).to all(be_a(Movie))
      expect(@user_movies2.movies).to all(be_a(Movie))
    end
  end

  describe '#user' do
    it 'has a user' do
      expect(@user_movies1.user).to eq(@user1)
      expect(@user_movies2.user).to eq(@user2)
    end
  end

  describe '#query' do
    context 'it is passed a query argument' do
      it 'has a query' do
        expect(@user_movies1.query).to eq('star wars')
      end
    end

    context 'it is not passed a query argument' do
      it 'defaults to nil' do
        expect(@user_movies2.query).to eq(nil)
      end
    end
  end

  describe '#user_name' do
    it 'returns the user name' do
      expect(@user_movies1.user_name).to eq(@user1.name)
      expect(@user_movies2.user_name).to eq(@user2.name)
    end
  end
end
