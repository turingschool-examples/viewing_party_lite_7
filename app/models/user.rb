class User < ApplicationRecord
  belongs_to :movie_watch_party, optional: true
end