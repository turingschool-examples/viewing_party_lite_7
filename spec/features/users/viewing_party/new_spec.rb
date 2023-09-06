# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Viewing Party', type: :feature do
  before :each do 
    @user = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)

    @movie = Movie.new({id: 13, title: 'Forrest Gump'})

    visit login_path

    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_button('Sign In')
  end

  describe 'When visting new viewing party form', :vcr do
    context 'as a logged in user' do
      it 'has a form' do 
        visit new_user_movie_viewing_party_path(@user, @movie.id)
      end
    end
  end
end

# ! I KNOW IM SORRY :(((((
