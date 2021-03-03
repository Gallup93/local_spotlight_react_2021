# Local Spotlight

Local Spotlight is a user-driven database of Spotify artists and the city/state associated with that artist. The ultimate goal is to make it easier to discover and share the artists that live and play in your community.

Heroku Live Link: http://local-spotlight.herokuapp.com/

# Tech Stack

* Ruby version '2.6.3'

* Rails version '~> 6.0.3', '>= 6.0.3.4'

* React

* PostgreSQL

* RSpec

* Devise

# Current Schema
![schema](/public/LS_v1_schema.png)
# Current User Features

* Login/Signup (via devise) 
`` '/users/sign_in' ``
`` '/users/sign_up' ``

* Browse artists in database
`` '/artists' ``

* Add new artist to database
`` '/artists/new' ``

# Where things are:

Right now, I am nearing the completion of V1 base functionality. V1 functionality includes: 
* User login/signup (Devise gem)
* Browse artists in database by city/state
* Add new artist to database
* Favoriting*
* Artist show page (spotify discog)*

[*in progress]

V1 started off as a learning exercise in JavaScript and React. While I’m proud of the progress I’ve made, I know there is a lot of room for refactoring what I have before I start the full planning process for V2. 

## V1 Refactoring 
* Testing. Need to implement Webmock/VCR and learn Jest testing for React
* Annotations 
* Making artist submission easier (dynamic spotify_id source acceptance/directive) 
* Making city/state search more dynamic (case sensitivity and close name matches) [possibly restricting locations searches to valid locations in the database]
* Show user what locations currently exist in database with artist associations 
* Make artist index list scrollable
* Implement user authorization for submitting & favoriting artists
* Add sort drop down menu to artists index

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
