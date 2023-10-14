# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ViewingPartyFacade do
  before(:each) do
    @user = User.create!(name: 'Kiwi', email: 'kiwibird@gmail.com')
    @user2 = User.create!(name: 'Chicken', email: 'chickenbird@gmail.com')
    @movie_id = 926393
    @facade = ViewingPartyFacade.new(@movie_id, @user.id)
  end

  it 'exists' do
    expect(@facade).to be_an_instance_of(ViewingPartyFacade)
    expect(@facade.movie).to be_an_instance_of(Movie)
    expect(@facade.guests).to_not be nil
  end

  describe "#create_movie" do
    it "returns a newly created Movie poro" do
      expect(@facade.create_movie(@movie_id)).to be_an_instance_of(Movie)
    end
  end
end
