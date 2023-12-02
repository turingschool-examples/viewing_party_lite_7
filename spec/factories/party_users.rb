FactoryBot.define do
  factory :party_user do
    association :user_id, factory: :user
    association :viewing_party_id, factory: :viewing_party
  end
end
