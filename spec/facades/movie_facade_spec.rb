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
      @result = @facade.movie
    end
    expect(@result).to be_instance_of(Movie)
  end
end