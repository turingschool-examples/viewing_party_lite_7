require "rails_helper"

describe User do
	describe "relationships" do
		it { should have_many :user_parties }
		it { should have_many(:parties).through(:user_parties) }
	end

	describe "validations" do
		it { should validate_presence_of :email }
		it { should validate_uniqueness_of :email }
		it "should validate that it's an email" do
			john = User.new(name: "John Smith", email: "jsmith@gmail.com")
			expect(john.valid?).to be(true)

			john = User.new(name: "John Smith", email: "fasd324223")
			expect(john.valid?).to be(false)
		end
	end
end