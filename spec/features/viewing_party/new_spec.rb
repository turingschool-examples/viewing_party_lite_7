require 'rails_helper'

RSpec.describe 'new viewing party page', type: :feature do
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

    it 'They see movie title at top of page above a form' do
      expect(page).to have_content('The Godfather')
    end

    it 'They see a form that includes Duration (default runtime), When Party Starts, Checkboxes next to each existing user, and button Create Party' do
      expect(page).to have_field('Duration of Party', with: 175)
      expect(page).to have_field('Date', with: Date.today)
      expect(page).to have_field('Start Time')
      expect(page).to have_unchecked_field("[invitees][#{@user_2.id}]")
      expect(page).to_not have_unchecked_field("[invitees][#{@user_1.id}]")
      expect(page).to have_selector(:link_or_button, 'Create Party') 
    end

    it 'They fill in form with duration >= runtime, date, start time, a user, submit, redirects users dashboard' do
      fill_in 'Duration', with: 175
      fill_in 'Date', with: Date.today
      fill_in 'Start Time', with: "07:25"
      page.check("[invitees][#{@user_2.id}]")
      click_button 'Create Party'

      expect(current_path).to eq(user_path(@user_1))
      expect(page).to have_content("Sam's Dashboard")
    end

    it 'They fill in form with duration < runtime, date, start time, a user, submit, redirects users dashboard' do
      WebMock.allow_net_connect! 
      WebMock.disable! 
      VCR.eject_cassette 
      VCR.turn_off!(:ignore_cassettes => true)

      fill_in 'Duration', with: 174
      fill_in 'Date', with: Date.today
      fill_in 'Start Time', with: "07:25"
      page.check("[invitees][#{@user_2.id}]")
      click_button 'Create Party'

      expect(current_path).to eq("/users/#{@user_1.id}/movies/#{@movie_facade.id}/viewing_party/new")
      expect(page).to have_content("Not enough time")
    end
  end
end