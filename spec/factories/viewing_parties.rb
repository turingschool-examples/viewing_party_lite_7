# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party do
    association :user
    association :movie
    date_time { Faker::Time.forward(days: 30) }
  end
end
