require 'rails_helper'

RSpec.describe MovieFacade do 
  it 'converts parsed api results into poros', :vcr do 
    facade = MovieFacade.new(872585)

    expect(facade.get_movie).to be_a(Movie)

    expect(facade.get_cast).to be_an(Array)
    expect(facade.get_cast.first).to be_a(String)

    expect(facade.get_reviews).to be_an(Array)
    expect(facade.get_reviews.first).to be_a(Review)
  end
end