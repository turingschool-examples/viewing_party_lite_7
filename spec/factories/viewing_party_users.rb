# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party_user do
    association :user, :viewing_party
    user_type { 0 }

    trait :host do
      user_type { 1 }
    end

    factory :viewing_party_host, traits: [:host]
  end
end
