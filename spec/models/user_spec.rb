require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    user1 = User.create!(name: "Timmy Turner", email: "timmyturner1@gmail.com")
    user2 = User.create!(name: "Wanda", email: "ilovecosmo1@gmail.com")
    user3 = User.create!(name: "Cosmo", email: "ilovewanda1@gmail.com")
  end

endrequire 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
