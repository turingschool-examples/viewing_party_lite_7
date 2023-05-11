FactoryBot.define do
  factory :partygoer do
    association :user
    association :party
    host { false }
  end
end
