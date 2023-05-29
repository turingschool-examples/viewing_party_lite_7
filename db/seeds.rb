require "factory_bot_rails"
require "faker"

10.times do
  FactoryBot.create(:user)
end