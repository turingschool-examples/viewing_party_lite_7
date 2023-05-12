class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  def movie_title
    viewing_party = ViewingParty.find(self.viewing_party_id)
    MovieService.movie_search(viewing_party.movie_id)[:title]
  end
end
