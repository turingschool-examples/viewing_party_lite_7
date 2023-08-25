require 'rails_helper'

describe ShowFacade do
  context "instance methods" do
    it "can create a movie object", :vcr do
      params = { id: 238 }
      facade = ShowFacade.new(params)
      movie = facade.movie
          
      expect(movie).to be_a Movie
    end
    
    it "can create a cast member object", :vcr do
      params = { id: 238 }
      facade = ShowFacade.new(params)

      cast_members = facade.cast_members
      
      cast_members.each do |cast_member|
        expect(cast_member).to be_a CastMember
      end
    end

    it "can create a review object", :vcr do
      params = { id: 238 }
      facade = ShowFacade.new(params)

      reviews = facade.reviews
          
      reviews.each do |review|
        expect(review).to be_a Review
      end
    end
  end
end