# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserFacade do
  before(:each) do
    @user = User.create!(name: 'Kiwi', email: 'kiwibird@gmail.com')
    @facade = UserFacade.new(@user.id)
  end

  it 'exists' do
    expect(@facade).to be_an_instance_of(UserFacade)
    expect(@facade.user).to be_an_instance_of(User)
  end

  describe '#movie_poster_link' do
    it 'returns a link to grab a movie poster from TMDB' do
      json_response = File.read('spec/fixtures/movie_images.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393/images?api_key=#{Rails.application.credentials.tmdb[:key]}")
        .to_return(status: 200, body: json_response)

      expect(@facade.movie_poster_link(926_393)).to be_a String
    end
  end

  describe '#get_movie_title' do
    it 'returns a movie title from TMDB' do
      json_response = File.read('spec/fixtures/movie_details.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/926393?api_key=#{Rails.application.credentials.tmdb[:key]}")
        .to_return(status: 200, body: json_response)

      expect(@facade.get_movie_title(926_393)).to be_a String
    end
  end
end
