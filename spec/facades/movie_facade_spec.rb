require "rails_helper"

RSpec.describe MovieFacade do
  before :each do
    @user = create(:user)
    params = { :user_id=>@user.id,
               :id=>238
              }
    @facade = MovieFacade.new(params)
  end

  it 'can create a new MoviesFacade' do
    expect(@facade).to be_instance_of(MovieFacade)
    expect(@facade.user).to eq(@user)
    expect(@facade.movie_id).to eq(238)
  end

  it 'can create a new service' do
    expect(@facade.service).to be_instance_of(MoviedbService)
  end

  it "can find a movie and its attributes" do
    VCR.use_cassette("godfather_movie") do
      @result = @facade.movie_info
    end
    expect(@result).to be_instance_of(Hash)
  end

  it "can find a movie's cast members" do
    VCR.use_cassette("godfather_movie_cast") do
      @result = @facade.movie_cast
    end

    expect(@result).to be_instance_of(Array)
  end

  it "can find a movie's reviews" do
    VCR.use_cassette("godfather_movie_reviews") do
      @result = @facade.movie_reviews
    end
    
    expect(@result).to be_instance_of(Hash)
  end

  it "can combine movie data before creating poros" do
    VCR.use_cassette("godfather_movie_combined") do
      @result = @facade.combine
    end

    expect(@result).to be_instance_of(Hash)
    expect(@result.keys).to include(:title, :id, :vote_average, :runtime, :genres, :overview, :reviews)
  end

  it "can create a new movie object with all of the combined information" do
    VCR.use_cassette("godfather_movie_combined") do
      @result = @facade.movie
    end

    expect(@result).to be_an_instance_of(Movie)
  end
end