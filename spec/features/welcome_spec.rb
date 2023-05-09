require 'rails_helper' 

RSpec.describe '/', type: :feature do
  
  describe 'When a user visits the root path' do
    it "should be on the landing page ('/')" do
      visit '/'
    end
  end
end