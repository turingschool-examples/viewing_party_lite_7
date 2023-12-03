# frozen_string_literal: true

class Movie < ApplicationRecord
  # should only be added to database after user starts a watchparty for that movie
  validates :title, :id, presence: true

  has_many :viewing_parties

  has_one_attached :poster

  after_create :retrieve_and_attach_poster

  private

  def retrieve_and_attach_poster
    # Call your API service to retrieve the poster
    TMDBService.get_poster(poster_path)

    self.poster.attach(
      io: File.open("app/assets/images" + poster_path),
      filename: poster_path.delete("/"),
      content_type: "image/jpeg"
    )
  end
end
