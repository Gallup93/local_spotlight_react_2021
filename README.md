# Local Spotlight

Local Spotlight is a user-driven database of Spotify artists and the city/state associated with that artist. The goal is to make it easier to discover and share the music that is being created by the people in your community. This is v1.0 (in progress) and is currently serving as a development playground for me while I get more and more familiar with both JavaScript and React. The backend was built using Rails and Postgres. The plan moving foward is to finish the v1 functionality (listed below) and then spend a healthy amount of time improving the code i've already written. From there, I'll document and annotate before starting to plan out what v1.1 will look like.

Heroku Demo: http://local-spotlight.herokuapp.com/

# Tech Stack

* Ruby version '2.6.3'
* Rails version '~> 6.0.3', '>= 6.0.3.4'
* React
* PostgreSQL
* RSpec
* Devise

# Current Schema
![schema](/public/local_spotlight_MVP.png)
# Current User Features

* Login/Signup (via devise) 
`` '/users/sign_in' ``
`` '/users/sign_up' ``

* Browse artists in database
`` '/artists' ``

* View specfic artist (discography)
`` '/artists/:id' ``

* Add new artist to database
`` '/artists/new' ``

# v1.0 MVP functionality:

* User login/signup (powered by Devise)
* Browse artists in database by city/state and listen to their top tracks.
* Browse and listen to a specific artist's discography
* Add a new artist to Local Spotlight database

* Favoriting an artist (in progress)

## V1 Refactoring and expanding on MVP functioanlity. 

* Making artist submission easier (dynamic spotify_id source acceptance and directions on how to find the url/uri/id) 
* Making city/state search more dynamic (case sensitivity and close name matches) [possibly restricting user input in the text field to only be able to search for a valid city/state]
* Create a list of all locations in database with a submitted artist associated to them. [make this default browse page for guest users]
- Make artist index list scrollable
* Implement user authorization for submitting & favoriting artists
* Add sorting options for the artist index page
* Do better at naming things and add better annotations 

## Early V2 Functionality Ideas
* Implement genre info for sorting/recommendations
* Commenting on artist pages
* User show page (top 8)
* Friending 
* Sharing to music feed
* Add artists to playlist/follow on spotify

This repository started as a playground for the revision of the original Local Spotliight V1 which was created as a school project in 2020. 
- Original LS Repo: https://github.com/Gallup93/local_spotlight
- Original LS Live Heroku: https://polar-caverns-76159.herokuapp.com/ 
