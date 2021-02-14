# Local Spotlight

Local Spotlight is a user-driven database of Spotify artists and their assocaited home city/state. The purpose of the application is to help users find and share local music in their communities. 

This repository is a playground for the revision of the original Local Spotliight V1 which was created as a school project in 2020. 
- Original LS Repo: https://github.com/Gallup93/local_spotlight
- Original LS Live Heroku: https://polar-caverns-76159.herokuapp.com/ 

# Tech Stack

* Ruby version '2.6.3'

* Rails version '~> 6.0.3', '>= 6.0.3.4'

* React

* PostgreSQL

* RSpec

* Devise
 
# Current User Features

* Login/Signup (via devise) 
`` '/users/sign_in' ``
`` '/users/sign_up' ``

* Browse artists in database
`` '/artists' ``

* Add new artist to database
`` '/artists/new' ``

# Current Plans

This repository started off as a playground for me to learn the basics of React and JavaScript. My immediate focus is on finishing the minimum viable project, getting it deployed for resume purposes, and then working hard on refactoring before starting the process of properly planning out the next sprint of development. 

current to-do item:

- Finish functionality for changing 'selected_artist' onClick from the artists index page
- Implement user authorization
- Fail gracefully when no artists assocaited with a location
- More dynamic handeling of user input (location verification)
- Beef up the testing
- Retain user input after invalid submissions/page refresh
- Add a 404 page
- Implement VCR for API testing
- Create user-favorites functionality
- Deploy to Heroku
