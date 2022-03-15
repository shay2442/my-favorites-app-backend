Favorite Places
### About this app
This app is designed to provide the client or the user a place where they can save all of their favorite places that they have visited. Once they create an account, or login to their account, they will be able to see all of the favorite spots they have gone to, the address of that location, the category of the type of place (i.e. restaurant, park, museum ) a picture of the location, how expensive it was,  and some notes about what they enjoyed about it.  They will also be able to search by what category of a place they are searching for. For instance if they are planning a camping trip, they can search "parks" or "camping" or whatever they chose to save that under, or if they are hungery they can search restaraunts. 

### TO get this app running clone or fork this repository

git@github.com:shay2442/favorite-places.git

### Then run the following commands in the terminal 
bundle install
rails db:create
npm install --prefix client

### Make sure to migrate and seed the data, bu running
rails db:migrate
rails db:seed

### Now you are able to start the servers 
The frontend is setup to run on PORT 4000 at localhost:4000
`npm start --prefix client`

The backend is setup to run on http://localhost:3000
`rails s`

