# require "rails_helper"

# RSpec.describe Movie do
#   describe "validations" do
#     it { should validate_presence_of :title }
#     it { should validate_presence_of :genre }
#     it { should validate_presence_of :summary }
#     it { should validate_presence_of :cast }
#     it { should validate_presence_of :reviews }
#     it { should validate_presence_of :reviewers }
#     it { should validate_presence_of :rating }
#     it { should validate_presence_of :runtime }

#     it { should validate_numericality_of :rating } #less_than_or_equal_to: 10
#     it { should validate_numericality_of :runtime }
#   end
#   describe "relationships" do
#     it { should have_many :viewing_parties }
#     it { should have_many(:viewing_users).through(:viewing_parties) }
#   end
# end