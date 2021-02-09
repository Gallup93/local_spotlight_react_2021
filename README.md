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

This repository started off as a playground for me to learn the basics of React and JavaScript. My immediate plan moving forward from this point is to refactor the features that are already completed to be more dry and efficient. More importantly, I need to learn how to test React components and get the testing to a more respectable place. As for features, I need to learn how to use state and ajax calls to refresh the "selected artist" every time you click on an artists from the index page. From there, it will be time to add an Artist show page. 

other to-do items:

- Provide error messages for invalid location submissions (artist index, artist creation, user signup)
- Implement user authorization 
- Prevent selection of random locations that dont have associated artists
