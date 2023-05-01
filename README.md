
<div align="center">
 <img src="https://user-images.githubusercontent.com/116964982/235525349-f6cee98c-6fa0-4bc9-98f0-aed05dd962e5.png" alt="Movie Night Invite" height="300">
<br><br>

:popcorn: Tired of endlessly scrolling streaming services, looking for the perfect movie to watch? :popcorn: <br>
Look no further! With this app, you can explore a variety of movie options and easily plan your next virtual movie night with friends!
</div>

---

<br>
<h3> :clapper: About this Project</h3>

This project is based on [Viewing Party Lite](https://backend.turing.edu/module3/projects/viewing_party_lite) from the [Turing School of Software & Design](https://turing.edu/). Backend students were provided [wireframes](https://backend.turing.edu/module3/projects/viewing_party_lite/wireframes) in order to build out this application. This app allows users to explore and select movies, create a viewing party event, and invite other users to join. The aim of this project was to build out complete CRUD funcitonality, create a many-to-many database relationship, and consume an API that requires authentication. 
<br>

<br>
<h3> :clapper: Built With</h3>

![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
<br>

<br>
<h3> :clapper: Getting Started</h3>

If you'd like to demo this API on your local machine:
- Ensure you have all prerequisites
      - Ruby Version 3.1.1
      - Rails Version 7.0.4.x
      - Bundler Version 2.4.9
- Grab your API key: [https://api.themoviedb.org/3](https://developers.themoviedb.org/3/getting-started/introduction)
- Clone this repo: `git clone git@github.com:MelTravelz/movie_night_invite.git`
- Navigate to the root directory: `cd movie_night_invite`
- Then run:
    - `bundle install`
    - `bundle exec figaro install`
    - `rails db:{create,migrate,seed}`
- In the "app/config/application.yml' file add you API key:
    - `TMDB_API_KEY: api_key_add_here`
- To run all tests run:
    - `bundle exec rspec` 
<br>

---

<br>
<h3> :clapper: Schema Diagram</h3>

<img src="https://user-images.githubusercontent.com/116964982/235530351-e97377a3-ba63-4492-949a-9649640c852a.png" alt="Movie Night Invite Schema" height="300">

<br>
<h3> :clapper: Simple Browser View</h3>

<img src="https://user-images.githubusercontent.com/116964982/235530915-d7ad26c6-903e-411e-84a5-bb8387136187.png" alt="Movie Night Invite Browser View" height="600">


