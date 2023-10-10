def load_test_data
  @anne = User.create!(name: "Anne Anderson", email: "anne.anderson@aol.com")
  @blair = User.create!(name: "Blair Busch", email: "Blair@aol.com")
  @cindy = User.create!(name: "Cindy Conners", email: "CC@aol.com")


  @arthor = ViewingParty.create!(movie_title: "Arthor", duration: 140, date_time: 10.days.from_now )
  @batman = ViewingParty.create!(movie_title: "Batman", duration: 240, date_time: 11.days.from_now )
  @candyman = ViewingParty.create!(movie_title: "Candyman", duration: 380, date_time: 12.days.from_now )
  @dogma = ViewingParty.create!(movie_title: "Dogma", duration: 400, date_time: 13.days.from_now )

  @host_1 = UserViewingParty.create!(host: true, user: @anne, viewing_party: @arthor )
    @visit_1_1 = UserViewingParty.create!(host: false, user: @blair, viewing_party: @arthor)
    @visit_1_2 = UserViewingParty.create!(host: false, user: @blair, viewing_party: @arthor)
    
  @host_2 = UserViewingParty.create!(host: true, user: @anne, viewing_party: @batman)
    @visit_2_1 = UserViewingParty.create!(host: false, user: @blair, viewing_party: @batman)
    
  @host_3 = UserViewingParty.create!(host: true, user: @blair, viewing_party: @candyman)
    @visit_3_1 = UserViewingParty.create!(host: false, user: @anne, viewing_party: @candyman)
end