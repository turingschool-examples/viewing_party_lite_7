# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'home landing page', type: :feature do
  it 'displays the landing page with links' do
    User.create(name: 'Allan', email: 'allan@allan.com')

    visit root_path

    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_content('Existing Users:')
    expect(page).to have_link('Create a New User')
    expect(page).to have_link('Allan')
  end
end
