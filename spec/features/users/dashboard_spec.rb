require "rails_helper"

RSpec.describe "User Dashboard" do 
  before :each do
    movie_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: movie_response)
    shawshank_response = File.read('spec/fixtures/shawshank.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: shawshank_response)

    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @user_4 = create(:user)
    @movie_1 = Movie.new(JSON.parse(movie_response, symbolize_names: true))
    @movie_2 = Movie.new(JSON.parse(shawshank_response, symbolize_names: true))
    
    @viewing_party_1 = ViewingParty.create!(duration: '180', party_date: Date.today, party_time: Time.now, movie_id: @movie_1.id, host_id: @user_1.id)
    @viewing_party_2 = ViewingParty.create!(duration: '150', party_date: Date.today, party_time: Time.now, movie_id: @movie_2.id, host_id: @user_2.id)

    @user_party_1 = UserParty.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
    @user_party_2 = UserParty.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_2.id)
    @user_party_3 = UserParty.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_2.id)

    visit '/'

    click_on "Log In"

    fill_in :email, with: @user_1.email
    fill_in :password, with: @user_1.password

    click_button("Log In")
  end

  it "will have the user's name" do 
    expect(page).to have_content(@user_1.name)
  end 

  it 'will have a button to Discover Movies' do 
    expect(page).to have_link("Discover Movies")

    click_on "Discover Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  it 'displays the viewing party information' do
    within "#party-#{@movie_1.id}" do
      expect(page).to have_content(@viewing_party_1.party_time.strftime('%I:%M%p'))
      expect(page).to have_content(@viewing_party_1.party_date.strftime('%B %d, %Y'))
    end
  end

  it 'displays the attendees' do
    within "#party-#{@movie_1.id}" do
      expect(page).to have_content("#{@user_1.name}")
      expect(page).to_not have_content("#{@user_3.name}")
    end
  end

  it 'the movie title is a link to the movies show page' do
    expect(page).to have_link("#{@movie_1.title}")
  end

  describe 'log in' do
    before :each do
      visit "/"

      click_on "Log Out"
    end
  
    it 'successful log in takes users to their discover show page' do
      expect(page).to have_content("Log In")

      click_on "Log In"

      fill_in :email, with: @user_1.email
      fill_in :password, with: @user_1.password

      click_on("Log In")

      expect(current_path).to eq(user_path(@user_1.id))
    end

    describe 'log out' do
      before :each do
        visit '/'

        click_on "Log In"

        fill_in :email, with: @user_1.email
        fill_in :password, with: @user_1.password

        click_button("Log In")
      end

      it 'has a button to log out' do
        visit '/'
        
        expect(page).to have_content("Log Out")

        click_on "Log Out"

        expect(page).to have_content("Log In")
      end

      it 'log out deletes the session' do
        visit '/'

        click_on "Log Out"

        expect(current_path).to eq('/')

        expect(page).to have_content("Log In")
      end

      it 'user can not access user show page without logging in' do
        visit '/'

        click_on "Log Out"
        visit user_path(@user_1.id)

        expect(current_path).to eq('/')
        expect(page).to have_content("Log in to view this page")
      end

      it 'unsuccessful log in takes users to the login page and displays flash message' do
        visit "/"
        
        click_on "Log Out"

        click_on "Log In"
  
        fill_in :email, with: "not a user"
  
        click_on("Log In")
  
        expect(page).to have_content("Log In")
        expect(page).to have_content("Invalid Credentials")
      end
    end
  end
end