require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    describe "associations" do
      it { should have_many :movie_watch_parties }
      it { should have_many(:watch_parties).through(:movie_watch_parties) }
    end

    describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of :email }
      it { should validate_presence_of :password }
      # it { should validate_presence_of :password_digest }
      it { should have_secure_password }
    end
  end

end
