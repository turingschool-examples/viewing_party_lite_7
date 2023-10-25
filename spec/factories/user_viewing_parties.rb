# frozen_string_literal: true

FactoryBot.define do
  factory :user_viewing_party do
    host { false }
    user { nil }
    viewing_party { nil }
  end
end
