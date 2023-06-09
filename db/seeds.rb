require "factory_bot_rails"
require "faker"

User.create(name: "test", email: "test@test.com", password: "test")

10.times do
  FactoryBot.create(:user)
end