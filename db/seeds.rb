# frozen_string_literal: true

User.destroy_all

@user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
@user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
