def user_test_data
  @user1 = User.create!(name: 'Maggie', email: 'maggie@gmail.com')
  @user2 = User.create!(name: 'Max', email: 'max@gmail.com')
  @user3 = User.create!(name: 'Wolfie', email: 'wolfie@gmail.com')
  @user4 = User.create!(name: 'Ink Jet Printer', email: 'inkjet@gmail.com')
  @viewing_party1 = ViewingParty.create!(day: '2023-07-01', start_time: '04:00 PM', movie_id: 1,
                                         duration: 120, movie_title: 'Speed')
  @viewing_party2 = ViewingParty.create!(day: '2023-07-02', start_time: '05:00 PM', movie_id: 2,
                                         duration: 125, movie_title: 'Spirited Away')
  @viewing_party3 = ViewingParty.create!(day: '2023-07-03', start_time: '04:30 PM', movie_id: 3,
                                         duration: 130, movie_title: 'Up')

  @viewing_party4 = ViewingParty.create!(day: '2023-07-05', start_time: '06:00 PM', movie_id: 4,
                                         duration: 140, movie_title: 'Wolfie finds a bone!')
  @viewing_party5 = ViewingParty.create!(day: '2023-07-08', start_time: '06:45 PM', movie_id: 5,
                                         duration: 144, movie_title: 'Jaws')
  @viewing_party6 = ViewingParty.create!(day: '2023-07-08', start_time: '06:45 PM', movie_id: 6,
                                         duration: 144, movie_title: 'Max finds a cheese wheel!')

  @userparty1 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party1.id, host: true)
  @userparty2 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party2.id, host: true)
  @userparty3 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party3.id, host: true)

  @userparty4 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party4.id, host: false)
  @userparty5 = UserViewingParty.create!(user_id: @user1.id, viewing_party_id: @viewing_party5.id, host: false)
  @userparty6 = UserViewingParty.create!(user_id: @user2.id, viewing_party_id: @viewing_party5.id, host: false)
  @userparty7 = UserViewingParty.create!(user_id: @user3.id, viewing_party_id: @viewing_party5.id, host: false)
  @userparty8 = UserViewingParty.create!(user_id: @user4.id, viewing_party_id: @viewing_party5.id, host: true)
end

# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.include FactoryBot::Syntax::Methods
end
