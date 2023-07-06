class MovieWatchParty < ApplicationRecord
  belongs_to :user
  belongs_to :watch_party

  enum user_status: ["attending", "hosting"]

  def self.sort_attending
    where(user_status: "attending")

    # join a table and sort by date?
  end

  def self.sort_hosting
    where(user_status: "hosting")

    # join a table and sort by date?
  end
end