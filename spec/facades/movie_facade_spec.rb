require 'rails_helper'

describe MovieFacade do
  before :each do
    @search = MovieFacade.new('terminator')
    @batman = MovieFacade.new(155)
  end

  it 'exists' do
    expect(@search).to be_a(MovieFacade)
  end

  describe '#facade methods' do
    describe '#discover_search' do
      it 'can create poros of movies and returns an array of movies' do
        VCR.use_cassette('search_for_terminator', record: :new_episodes) do
          expect(@search.discover_search).to be_an_instance_of(Array)
          @search.discover_search.each do |movie|
            expect(movie).to be_a(Movie)
            expect(movie).to respond_to(:title)
            expect(movie).to respond_to(:average)
            expect(movie).to respond_to(:runtime)
            expect(movie).to respond_to(:genres)
            expect(movie).to respond_to(:summary)
          end
        end
      end
    end
    describe '#movie' do
      it 'can create poros of a single movie and returns it in a Movie object' do
        VCR.use_cassette('batman_details', record: :new_episodes) do
          expect(@batman.movie).to be_a(Movie)
          expect(@batman.movie).to respond_to(:title)
          expect(@batman.movie).to respond_to(:average)
          expect(@batman.movie).to respond_to(:runtime)
          expect(@batman.movie).to respond_to(:genres)
          expect(@batman.movie).to respond_to(:summary)
        end
      end
    end
    describe '#cast_members' do
      it 'can create poros of a single movie cast member details and returns it
      in a Cast Member object' do
        VCR.use_cassette('batman_cast_member_details', record: :new_episodes) do
          expect(@batman.cast_members).to be_an_instance_of(Array)
          @batman.cast_members.each do |cast|
            expect(cast).to be_a(CastMember)
            expect(cast).to respond_to(:name)
            expect(cast).to respond_to(:character)
          end
        end
      end
    end
    describe '#reviews' do
      it 'can create poros of a single movie review details and returns it in
      a Review object' do
        VCR.use_cassette('batman_review_details', record: :new_episodes) do
          expect(@batman.reviews).to be_an(Array)
          @batman.reviews.each do |review|
            expect(review).to be_a(Review)
            expect(review).to respond_to(:author)
            expect(review).to respond_to(:content)
          end
        end
      end
    end
  end
end
