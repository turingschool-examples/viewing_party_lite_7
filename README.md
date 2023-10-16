# Viewing Party

## Table of Contents
- [Summary of Work](#summary-of-work)
- [Contributors](#contributors)
- [Ideas for Refactor](#ideas-for-refactor)</br>


<h3 align="center">Project Description</h3>

<p align="center">
  "Viewing Party" This project is a web application that allows users to explore movies and create and schedule viewing parties with other users on the platform.
</p></br>

## Summary of Work
This project has 3 areas that we built out with functionality:
### User Creation
When a user visits the welcome page, if they have not already created a user account, they will be prompted to create a new user with their name and email.
### Discover Movies
Once a user has created their account, they will see a link on their dashboard to look through top movies or search for a movie by title. When the user follows either of these paths, the application will consume multiple external API endpoints to load movie results. The user can then click on an individual movie to pull up a list of details from that movie, including its title, vote average score, applicable genre(s), a summary, the first 10 cast members to appear in the credits, and a list of reviews on the movie.
### Viewing Party Creation
When viewing a movie's details, a user can create a viewing party for that movie, schedule the viewing party on a particular date and at a specific time, and they can invite as many or as few of the other users on the platform as they would like. Viewing parties that a user is hosting as well as those they are invited to will both appear on their user dashboard, including details such as movie poster, movie title, viewing party date and time, and the list of invitees.

## Contributors
- [Kaylee Janes](https://github.com/kbug819)
- [Lane Bretschneider](https://github.com/lanebret85)


## Ideas for Refactor
- Add more PORO classes to ensure that all API consumption for movie_credits and movie_reviews get abstracted into ruby objects before the data ever gets to the controller and ultimately the view
- Finding more opportunities to flash error messages in sad-path situations
- Seek out more opportunities for further edge case testing
