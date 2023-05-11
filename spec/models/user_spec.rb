# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name).with_message('must be filled out') }
    it { should validate_presence_of(:email).with_message('must be filled out') }
    it { should validate_uniqueness_of(:email).with_message('is already taken') }
  end

  describe "class methods" do
    it "::all_except_me" do
      @user_1 = User.create!(name: 'John Doe', email: 'johndoe@yahoo.com')
      @user_2 = User.create!(name: 'Alex Smith', email: 'Asmith@yahoo.com')
      @user_3 = User.create!(name: 'Elvis Presley', email: 'kingofrock@yahoo.com')

      result = User.all_except_me(@user_1)
      expect(result).to eq([@user_2, @user_3])
    end
  end
end
