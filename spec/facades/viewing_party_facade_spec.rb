require 'rails_helper'

describe ViewingPartyFacade do
  before :each do
    @user = create(:user)
    params = {"controller"=>"movies",
      :action=>"index",
      :user_id=>@user.id,
      :movie_title=>"Despicable"}
    @movie_facade = MovieFacade.new(params)
    @vp_facade = ViewingPartyFacade.new(params)
  end

  it 'can create a new ViewingPartyFacade' do
    VCR.use_cassette("viewing_party") do
     expect(@vp_facade).to be_instance_of(ViewingPartyFacade)
     expect(@vp_facade.user).to be_an_instance_of(User)
     expect(@vp_facade.movie).to be_an_instance_of(Movie)
    end
  end

  it 'can create a new service' do
    expect(@vp_facade.service).to be_instance_of(MoviedbService)
  end

  it 'can create a new movie' do
    VCR.use_cassette("viewing_party") do
      @result = @vp_facade.movie
    end

    expect(@result).to be_instance_of(Movie)  
  end

  it 'can create a new viewing_party' do
    VCR.use_cassette("viewing_party") do
      @result = @vp_facade.new_viewing_party
    end
    
    expect(@result).to be_instance_of(ViewingParty)  
  end
end