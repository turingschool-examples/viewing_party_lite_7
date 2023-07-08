FactoryBot.define do
  factory :party do
    duration {Faker::Number.between(from: 60, to: 180)}
    date  {Faker::Date.between(from: Date.today, to: 7.days.from_now)}
    start_time {Time.now}
  end
end