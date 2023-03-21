require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties)}
  end

  describe 'validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :email }
    it { validate_uniqueness_of :email}
  end
end