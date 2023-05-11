FactoryBot.define do
  factory :partygoer do
    sequence :id
    association :user
    association :party
    host { false }
  end
end
