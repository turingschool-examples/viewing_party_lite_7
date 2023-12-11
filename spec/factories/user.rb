FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }

    # This will generate a secure password hash using bcrypt
    after(:build) do |user|
      user.password_digest = BCrypt::Password.create(user.password)
    end
  end
end