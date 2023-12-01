require 'rails_helper'

RSpec.describe 'new viewing party page', type: :feature do
  describe 'When user visits "/users/:user_id/movies/:movie_id/parties/new"', :vcr do
    before(:each) do
      @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com')
      @user_2 = User.create!(name: 'Tommy', email: 'Tommy_t@email.com')

      @movie_facade = MoviesFacade.new.find_movie(238)

      @party = Party.create!(duration: @movie_facade.runtime, date: Date.today, start_time: "7:00" , movie_id: @movie_facade.id)
      UserParty.create!(user_id: @user_1.id, party_id: @party.id, host: true)

      # visit  new_user_movie_party(@user_1, @movie_facade.id, @party)
      # WHY did this have to be handrolled
      visit  "/users/#{@user_1.id}/movies/#{@movie_facade.id}/viewing_party/new"
    end

    # it 'They see a Home link that redirects to landing page' do
    #   expect(page).to have_link('Home')
    #   click_link "Home"
    #   expect(current_path).to eq(landing_path)
    # end

    it 'They see movie title at top of page above a form' do
      expect(page).to have_content('The Godfather')
    end

    it 'They see a form that includes Duration (default runtime), When Party Starts, Checkboxes next to each existing user, and button Create Party' do
      expect(page).to have_field('Duration of Party', with: 175)
      expect(page).to have_field('Day', with: Date.today)
      expect(page).to have_field('Start Time')
      # expect(page).to have_unchecked_field("")
      expect(page).to have_selector(:link_or_button, 'Create New User')    
    end

    xit 'They fill in form with information, email (unique), submit, redirects to user show page' do
      fill_in 'Name', with: "Sammy"
      fill_in 'Email', with: "sammy@email.com"
      click_button 'Create New User'

      new_user = User.last
      expect(current_path).to eq(user_path(new_user))
      expect(page).to have_content('Successfully Added New User')
    end

    xit 'They fill in form with information, email (non-unique), submit, redirects to user show page' do
      fill_in 'Name', with: "Sammy"
      fill_in 'Email', with: "sam_t@email.com"
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Error: Email has already been taken')
    end

    xit 'They fill in form with missing information' do
      fill_in 'Name', with: ""
      fill_in 'Email', with: ""
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content("Error: Name can't be blank, Email can't be blank")
    end

    xit 'They fill in form with invalid email format (only somethng@something.something)' do # Probably more invalid examples
      fill_in 'Name', with: "Sammy"
      fill_in 'Email', with: "sam sam@email.co.uk"
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Error: Email is invalid')

      fill_in 'Name', with: "Sammy"
      fill_in 'Email', with: "sam@email..com"
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Error: Email is invalid')

      fill_in 'Name', with: "Sammy"
      fill_in 'Email', with: "sam@emailcom."
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Error: Email is invalid')

      fill_in 'Name', with: "Sammy"
      fill_in 'Email', with: "sam@emailcom@"
      click_button 'Create New User'

      expect(current_path).to eq(register_user_path)
      expect(page).to have_content('Error: Email is invalid')
    end
  end
end