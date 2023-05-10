require 'rails_helper' 

RSpec.describe 'Navigation' do
  scenario 'User can navigate back to home page using the nav bar' do
    visit '/'

    within 'nav' do
      expect(page).to have_link('Home', href: root_path)
    end
  end
end