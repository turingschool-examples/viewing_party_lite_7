require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'when a user visits the users dashboard' do
    before(:each) do
      @user = create(:user)

      visit root_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      
      click_on 'Log In'
    end
    
    it 'displays the users name and Dashboard on the top of the page' do
      expect(current_path).to eq(user_path(@user))
      expect(page).to have_content("Welcome, #{@user.name}")
    end

    it 'displays a button to discover movies which redirects the user to the users discover page' do
      visit user_path(@user.id)

      expect(page).to have_button("Discover Movies")

      click_on("Discover Movies")

      expect(current_path).to eq(user_discover_index_path(@user))
    end
  end

  describe 'When user visits "/users/:user_id/movies/:movie_id/parties/new"', :vcr do
    before(:each) do
      @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com', password: 'elmoonfire12', password_confirmation: 'elmoonfire12')
      @user_2 = User.create!(name: 'Tommy', email: 'tommy_t@gmail.com', password:  'pegmel0715', password_confirmation:  'pegmel0715')
  
      visit root_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')

      fill_in :email, with: @user_1.email
      fill_in :password, with: @user_1.password
      
      click_on 'Log In'

      expect(current_path).to eq(user_path(@user_1))

      @movie_facade = MoviesFacade.new.find_movie(238)

      visit  "/users/#{@user_1.id}/movies/#{@movie_facade.id}/viewing_party/new"
    end

    it 'displays a section which contains a list of viewing parties including their movie image, title, date & time, and who is hosting/invited' do
      fill_in 'Duration', with: 175
      fill_in 'Date', with: "2023-12-01"
      fill_in 'Start Time', with: "07:25"
      check "[invitees][#{@user_2.id}]"
      click_button 'Create Party'

      expect(current_path).to eq(user_path(@user_1))
      expect(page).to have_content("Sam's Dashboard")
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("December 1, 2023 07:25")
      expect(page).to have_content("Hosting")

      visit user_path(@user_2)

      expect(page).to have_content("Tommy's Dashboard")
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("December 1, 2023 07:25")
      expect(page).to have_content("Invited")
    end 
  end
end

